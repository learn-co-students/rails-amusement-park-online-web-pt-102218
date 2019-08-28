class UsersController < ApplicationController 
    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id 
        render 'show'
    end

    def show 
        #@user = User.create(id: session[:user_id])
        
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
    end
end