require 'pry'
class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create
        @user = User.create(users_params)
        session[:id] = @user.id 
        redirect_to user_path(@user)
    end 

    def users_params 
       
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end 
end
