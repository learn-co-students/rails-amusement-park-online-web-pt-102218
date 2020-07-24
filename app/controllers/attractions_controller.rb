class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render new_attraction_path
    end

    def edit
      @attraction = Attraction.find(params[:id])
    end

    def update
      @attraction = Attraction.find(params[:id])
      if @attraction.update(attraction_params)
        flash[:notice] = "Attraction Successfully Updated"
        redirect_to attraction_path(@attraction)
      else 
        redirect_to 'edit', alert: "Please fill in all forms."
      end
    end





  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
