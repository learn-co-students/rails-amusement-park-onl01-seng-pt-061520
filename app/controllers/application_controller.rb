class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_to_signup_if_not_logged_in
    redirect_to root_path unless session[:user_id]
  end
end
