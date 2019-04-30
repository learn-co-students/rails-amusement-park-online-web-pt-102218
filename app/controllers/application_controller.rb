class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_logged_in?, :current_user, :admin?

  def is_logged_in?
    session[:user_id].present?
  end

  def current_user
    User.find(session[:user_id])
  end

  def admin?
    self.admin == true
  end


end
