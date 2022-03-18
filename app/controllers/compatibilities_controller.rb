class CompatibilitiesController < ApplicationController
  def create
    @like = Like.find(params[:id].to_i)
    @compatibility = Compatibility.new(user_1: @like.user, user_2: current_user, result: 0)
    redirect_to my_rooms_path
  end
end
