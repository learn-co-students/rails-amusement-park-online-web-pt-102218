class AttractionsController < ApplicationController

  def index
    if current_user.admin
      @admin = current_user
    end
    @attractions = Attraction.all
  end

  def show
    if current_user.admin
      @admin = current_user
    end
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    if current_user.admin
      @admin = current_user
    end
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    if current_user.admin
      @admin = current_user
    end
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
