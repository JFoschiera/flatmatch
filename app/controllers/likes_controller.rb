class LikesController < ApplicationController
  before_action :set_room, only: %i(create destroy)

  def create
    @like = Like.new(user: current_user, room: @room)
    @like.save
    redirect_to rooms_path(anchor: "resize-cards-#{@room.id}")
  end

  def destroy
    @like = @room.likes.where(user: current_user).first
    @like.destroy
    redirect_to rooms_path(anchor: "resize-cards-#{@room.id}")
  end

  private

  def set_room
    @room = Room.find(params[:room_id].to_i)
  end
end
