class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if attraction.tickets > user.tickets && attraction.min_height > user.height
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.height >= attraction.min_height && user.tickets >= attraction.tickets
            user.nausea = user.nausea + 2
            user.tickets = user.tickets - attraction.tickets 
            user.happiness = user.happiness + 4
            user.save
        end
    end



end
