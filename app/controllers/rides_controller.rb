class RidesController < ApplicationController 

    def create 
        #binding.pry
        @ride = Ride.create(attraction_id: params[:attraction_id], user_id: current_user.id)
        #binding.pry
        
        #@ride.take_ride
        flash[:notice] = @ride.take_ride
       # @ride.take_ride
        
        redirect_to user_path(@ride.user)
    end
end