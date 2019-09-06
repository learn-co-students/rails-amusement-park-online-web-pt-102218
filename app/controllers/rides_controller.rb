class RidesController < ApplicationController 

    def create 
        @ride = Ride.new
        
        @ride.take_ride
        
        redirect_to user_path(@user)
    end
end