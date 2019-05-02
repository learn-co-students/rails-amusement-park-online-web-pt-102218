class RidesController < ApplicationController
  def create
    # return redirect_to root_path unless logged_in?
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    return redirect_to root_path unless ride.user && ride.attraction
    flash[:success] = ride.take_ride
    redirect_to user_path(session[:user_id])
  end

  # def ride_params
  #   params.require(:attraction).permit(:id)
  #   params.require(:user).permit(:id)
  # end
end
