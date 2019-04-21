class AttractionsController < ApplicationController
  before_action :authentication_required, except: [:edit, :update]
  before_action :admin_only, only: [:edit, :update] 

  def index
    @attractions = Attraction.all 
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new 
    @attraction = Attraction.new
  end

  def create 
    @attraction = Attraction.new(attraction_params)
    if @attraction.save 
      redirect_to attraction_path(@attraction)
    else 
      render :new 
    end
  end

  def edit 
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id]) 
    if @attraction.update(attraction_params)
      flash[:messsage] = "#{@attraction.name} was succesfully updated."
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "Unable  to update #{@attraction.name} "
      render :edit
    end
  end


  def ride
    flash[:alert] = Ride.create(ride_params).take_ride

    redirect_to user_path(current_user)
  end

  private 

  def attraction_params 
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
