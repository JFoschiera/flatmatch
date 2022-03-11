class PhonesController < ApplicationController
  def new
    @phone = Phone.new
    current_user.phone = @phone
  end

  def create
    @phone = Phone.new(phone_params)
    @phone.save

    if @phone.save
      redirect_to new_answer_path, notice: 'Phone was successfully created.'
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
