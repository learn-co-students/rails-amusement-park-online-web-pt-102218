class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_logged_in?

  def is_logged_in?
    session[:user_id].present?
  end

  def admin?
    binding.pry
    self.admin == true
  end
end
