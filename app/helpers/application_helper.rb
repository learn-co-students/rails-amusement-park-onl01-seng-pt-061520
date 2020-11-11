module ApplicationHelper

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def admin
    current_user.admin if session[:user_id]
  end
end
