class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @current_user = current_user
    end 

    def show
        @attraction = Attraction.find(params[:id])
        @current_user = current_user
    end 

    def ride
        attraction = Attraction.find_by(id: params[:id])
        if session.has_key?(:user_id) && attraction
            ride = Ride.new
            ride.user = current_user
            ride.attraction = attraction
            response = ride.take_ride
            ride.save

            if response == ""
                redirect_to user_path(current_user), notice: "Thanks for riding the #{attraction.name}!"
            else 
                redirect_to user_path(current_user), alert: response
            end 
        end 
    end 

    def new
        if current_user.admin 
            @attraction = Attraction.new
        else
            redirect_to root_path
        end 
    end 

    def create
        if current_user.admin 
            @attraction = Attraction.create(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            redirect_to root_path
        end
    end 

    def edit
        if current_user.admin
            @attraction = Attraction.find_by(id: params[:id])
        else 
            redirect_to root_path
        end 
    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end 
end
