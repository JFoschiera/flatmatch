class RoomsController < ApplicationController

  # def index
  #   @rooms = Room.all
  #   set_markers
  # end

  def index
    @room = Room.new
    @rooms = Room.all
    if params[:query].present?
      @rooms = Room.search_by_city(params[:query])
      set_markers
    else
      @rooms = Room.all
      set_markers
    end
  end




  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    @room.save

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
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

  private

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
      :user_id
    )
  end

  def set_markers
    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end
end
