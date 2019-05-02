module AttractionsHelper
  def logged_in_as_admin?
    User.find_by_id(session[:user_id]).admin
  end
end
