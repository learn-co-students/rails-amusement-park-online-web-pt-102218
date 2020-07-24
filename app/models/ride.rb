class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride 
        response = []
        response << "Sorry. You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
        response << "Sorry. You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
        return response.join(' ') if !response.empty?

        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        "Thanks for riding the #{attraction.name}!"
    end 
end
