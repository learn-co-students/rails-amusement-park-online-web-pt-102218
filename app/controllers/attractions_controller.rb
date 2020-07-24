class AttractionsController < ApplicationController
  # before_action :authenticate_user

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new(attraction_id: @attraction.id, user_id: session[:user_id])
  end

  def new
    require_admin
    @attraction = Attraction.new
  end

  def create
    require_admin
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      redirect_to attraction_path(@attraction)
    else
      flash[:warning] ||= ""
      @attraction.errors.full_messages.each do |m|
        flash[:warning] += "#{m}\n"
      end
      render 'new'
    end

  end

  def edit
    require_admin
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    require_admin
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    if @attraction.valid?
      redirect_to attraction_path(@attraction)
    else
      flash[:warning] ||= ""
      @attraction.errors.full_messages.each do |m|
        flash[:warning] += "#{m}\n"
      end
      render 'edit'
    end
  end
  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height)
  end

  def require_admin
    admin = User.find_by_id(session[:user_id]) && User.find_by_id(session[:user_id]).admin?
    unless admin
      flash[:danger] = "You are not authorized to access this resource."
      return redirect_to root_path
    end
  end

  def logged_in?
    return User.find_by_id(session[:user_id])
  end

end
