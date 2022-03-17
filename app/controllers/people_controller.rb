class PeopleController < ApplicationController
  def show
    @person = User.find(params[:id])
  end
end
