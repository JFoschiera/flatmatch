class PeopleController < ApplicationController
  def show
    @person = User.find(params[:id])
    @like = Like.find(params[:like_id])
  end
end
