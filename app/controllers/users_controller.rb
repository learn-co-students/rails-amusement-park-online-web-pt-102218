class UsersController < ApplicationController 

    #before_action :authenticate_user, only: [:show]
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show 
        
        @user = User.find_by(id: params[:id])
      #binding.pry
        #@ride = Ride.create(attraction_id: params[:attraction_id], #user_id: current_user.id)

        #binding.pry
        #if !current_user.admin
            if current_user != @user
                redirect_to root_path
            end
       # end
       
        #if session[:user_id] != nil
         #   @user = User.find_by(id: session[:user_id])
        #else 
        #    redirect_to root_path
        #end

        # if !logged_in?
        #   redirect_to new_user_path
        #end

    end

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
    end
end