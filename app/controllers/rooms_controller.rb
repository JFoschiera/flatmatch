class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    if params[:query].present?
      @rooms = Room.search_by_city(params[:query])
      set_markers
    else
      @rooms = Room.all
      set_markers
    end

    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { room: room })
      }
    end

    @rooms.each do |room|
      set_compatibility(room)
    end
  end

  def show
    @room = Room.find(params[:id])
    set_compatibility(@room)
    @photos = @room.photos
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    @room.save

    if @room.save
      redirect_to rooms_path, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)

    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end

  def set_compatibility(room)
    result = 0
    if (room.user.answers && room.user.answers.length > 0) && (current_user.answers && current_user.answers.length > 0)
      room.user.answers.each_with_index do |answer, index|
        current_score = current_user.answers[index].score
        answer_score = answer.score
        difference = (current_score - answer_score).abs
        result += difference
      end
    end
    room.compatibility = 100 - (result * 2)
    room.save
  end

  private

  def set_markers
    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end

  def room_params
    params.require(:room).permit(
      :roommates,
      :size,
      :address,
      :city,
      :start_date,
      :end_date,
      :pets,
      :smoking,
      :visitors,
      :description,
      :floor,
      :price,
      :utilities,
      :user_id,
      photos: []
    )
  end
end
