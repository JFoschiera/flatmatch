class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone, :about, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone, :about, :avatar])
  end

  # def authenticate_user!
  #   if user_signed_in?
  #     redirect_to rooms_path
  #   else
  #     redirect_to root_path
  #   end
  # end



  def after_sign_in_path_for(_resource_or_scope)
    if !current_user.phone
      new_phone_path
    elsif !current_user.about
      new_about_path
    elsif !current_user.answers || current_user.answers.length < 10
      new_answer_path
    else
      rooms_path
    end
  end
end
