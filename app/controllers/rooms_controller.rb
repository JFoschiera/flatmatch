class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
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
      :status,
      :utilities,
      :heart,
      presence: true
    )
  end
end
