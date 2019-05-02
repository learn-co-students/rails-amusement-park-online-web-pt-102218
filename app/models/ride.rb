class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # byebug
    message = ''
    message += " You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    message += " You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    # byebug
    if message.blank?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      message = "Thanks for riding the #{attraction.name}!"
    else
      message = 'Sorry.' + message 
    end
    return message
  end
end
