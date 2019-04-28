class RidesController < ApplicationController

    def create 
        a = Attraction.find_by(id: params[:ride][:attraction_id]) 
        r = a.rides.create(user_id: current_user.id)
          redirect_to user_path(current_user) 
    end 

end
