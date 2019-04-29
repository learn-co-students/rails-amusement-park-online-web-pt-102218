class WelcomeController < ApplicationController

  def home
  end

  def signin
    @user = User.new
  end
end
