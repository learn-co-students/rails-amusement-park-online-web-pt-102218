class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
           # binding.pry
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            #binding.pry
            self.user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating )
            
           "Thanks for riding the #{self.attraction.name}!"
        end
    end

    

    
end
