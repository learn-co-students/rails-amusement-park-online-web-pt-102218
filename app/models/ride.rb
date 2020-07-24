class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        msg = []
        if attraction.tickets > user.tickets && attraction.min_height > user.height
             msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets
            msg <<"Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
            msg << "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.height >= attraction.min_height && user.tickets >= attraction.tickets
            user.tickets = user.tickets - attraction.tickets 
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            user.save
            msg << "Thanks for riding the #{self.attraction.name}!"
        end
        msg.join(" ")
    end
end
