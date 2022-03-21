class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @user = User.find(params[:user_id].to_i)
    @chatroom = Chatroom.new(name: @user.name, user: @user)
    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end
end
