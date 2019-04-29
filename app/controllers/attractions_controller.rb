class AttractionsController < ApplicationController
  def index
    binding.pry
    @attractions = Attraction.all
  end
end
