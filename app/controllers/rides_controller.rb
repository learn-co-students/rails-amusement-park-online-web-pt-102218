class RidesController < ApplicationController

  def create
    @ride = Ride.create(attraction_id: params[:id], user_id: session[:user_id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end
end
