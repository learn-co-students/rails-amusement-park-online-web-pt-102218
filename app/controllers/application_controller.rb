class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def home

  end 

  def current_user
    session.has_key?(:user_id) ? User.find_by(id: session[:user_id]) : nil
  end 
end