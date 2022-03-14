class AboutsController < ApplicationController
  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)
    @about.user = current_user
    @about.save

    if @about.save
      if !current_user.answers || current_user.answers.length < 10
        redirect_to new_answer_path
      else
        redirect_to rooms_path
      end
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
