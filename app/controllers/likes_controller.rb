class LikesController < ApplicationController
  before_action :set_room, only: %i(create destroy)

  def create
    @like = Like.new(user: current_user, room: @room)
    @like.save
    previous = request.referrer
    if previous.include?(room_path(@room.id))
      redirect_to room_path(@room.id)
    else
      redirect_to rooms_path(anchor: "resize-cards-#{@room.id}")
    end
  end

  def destroy
    @like = @room.likes.where(user: current_user).first
    @like.destroy
    previous = request.referrer
    if previous.include?(room_path(@room.id))
      redirect_to room_path(@room.id)
    elsif previous.include?("my-rooms")
      redirect_to my_rooms_path
    else
      redirect_to rooms_path(anchor: "resize-cards-#{@room.id}")
    end
  end

  def set_room
    @room = Room.find(params[:room_id].to_i)
  end
end
