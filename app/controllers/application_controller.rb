class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    msg = "#{user_signed_in? ? "Hello, #{current_user.email}" : "Please sign_in"}"
    render html: msg
  end
end
