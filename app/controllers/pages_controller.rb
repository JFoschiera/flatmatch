class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_rooms
    @compatibilities = Compatibility.where("user1_id = ? OR user2_id = ?", current_user.id, current_user.id)
    @chatrooms = Chatroom.all
  end
end
