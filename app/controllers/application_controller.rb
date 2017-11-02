class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def hello
    msg = "#{user_signed_in? ? "Hello, #{current_user.email}" : "Please sign_in"}"
    render html: msg
  end

  protected
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone, :name, :email, :password, :current_password, :is_female, :date_of_birth, :password_confirmation) }
  end

end
