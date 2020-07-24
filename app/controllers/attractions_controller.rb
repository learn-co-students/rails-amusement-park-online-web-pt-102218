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
            att = Attraction.create(attraction_params)
            redirect_to attraction_path(att)
        else
            redirect_to :root
        end
    end

    def add
        flash[:alert] = Ride.create(ride_params).take_ride
        redirect_to user_path(current_user)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        att = Attraction.find(params[:id])
        att.update(attraction_params)
        redirect_to attraction_path(att)
    end
    # def add
    #     ride = Ride.new(ride_params)
    #     binding.pry
    #     attr = Attraction.find(params[:attr]) 
    #     current_user.attractions << attr
    #     current_user.tickets -= attr.tickets
    #     current_user.nausea += attr.nausea_rating
    #     current_user.happiness += attr.happiness_rating
    #     current_user.save
    #     redirect_to user_path(current_user)
    # end

    # def create 
    #     @attraction = Attraction.new(params.permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
    #     if @attraction.save 
    #       redirect_to user_path(@attraction)
    #     else 
    #       render :new 
    #     end
    # end

    private
    
    def attraction_params 
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def ride_params
        params.permit(:user_id, :attraction_id)
    end
    
end
