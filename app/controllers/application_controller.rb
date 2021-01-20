class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    edit_user_registration_path(current_user) # your path
  end

  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password)}

       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :email, :password, :password_confirmation, :current_password, :city, :state, :country, :phone_number, :gender, :image)}
  end
end
