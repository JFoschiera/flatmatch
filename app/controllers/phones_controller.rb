class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    @phone.user = current_user
    @phone.save

    if @phone.save
      redirect_to new_about_path, notice: 'Phone was successfully created.'
    else
      render :new
    end
  end

  def phone_params
    params.require(:phone).permit(
      :cellphone,
      :user_id
    )
  end
end
