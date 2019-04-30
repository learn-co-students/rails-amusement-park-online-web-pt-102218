class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # byebug
    error = 'Sorry.'
    error += " You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    error += " You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    if error == 'Sorry.'
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    else
      error
    end
  end
end
