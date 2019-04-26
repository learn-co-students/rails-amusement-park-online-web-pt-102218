class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all 
    end 

    def new 
        @attraction = Attraction.new 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
    end 

    def create 
        if current_user.admin?
            attraction = Attraction.create(attraction_params)
        else 
            redirect_to :root
        end 
    end 


    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end 

    def ride_params
        params.permit(:user_id, :attraction_id)
    end 

end
