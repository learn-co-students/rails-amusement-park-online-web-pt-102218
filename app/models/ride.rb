class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
    
    def take_ride
        #alternative responses
        response = []
        response << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
        response << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
        return "Sorry. " + response.join(' ') if !response.empty?

        #regular response
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        "Thanks for riding the #{attraction.name}!"
    end

end
