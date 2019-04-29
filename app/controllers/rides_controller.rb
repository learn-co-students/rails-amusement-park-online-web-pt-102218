class RidesController < ApplicationController

    def create 
       r = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction_id])
        @message = r.take_ride
        @user = r.user
          redirect_to user_path(@user, :message => @message ) 
    end 



end
