class AboutsController < ApplicationController


  # def show
  #   @about = User.find(params[:id])
  # end

  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)
    @about.user = current_user
    @about.save

    if @about.save
      redirect_to rooms_path, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  private

  def about_params
    params.require(:about).permit(
      :about_user,
      :user_id
    )
  end
end
