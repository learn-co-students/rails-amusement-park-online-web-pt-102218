class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
        #binding.pry
        if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
            #binding.pry
            new_tickets = self.user.tickets - self.attraction.tickets
            
            new_nausea = self.user.nausea + self.attraction.nausea_rating 
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(:happiness => new_happiness, :tickets => new_tickets, :nausea => new_nausea)
#binding.pry
# t = self.user.tickets - self.attraction.tickets
# self.user.tickets = t
# self.user.nausea = self.user.nausea + self.attraction.nausea_rating 
# self.user.happiness = self.user.happiness + self.attraction.happiness_rating
# #binding.pry

        elsif self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

    

    
end
