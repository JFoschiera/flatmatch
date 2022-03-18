class CompatibilitiesController < ApplicationController
  def create
    @like = Like.find(params[:like_id].to_i)
    @compatibility = Compatibility.new(user1: @like.user, user2: current_user)
    @compatibility.save

    redirect_to my_rooms_path
  end
end
