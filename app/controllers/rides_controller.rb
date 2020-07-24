class RidesController < ApplicationController
    belongs_to :attraction
    belongs_to :user

    def take_ride
        error = ""

        if self.user.tickets < self.attraction.tickets
            error += "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else 
            self.user.tickets -= self.attraction.tickets 
        end 
        if self.user.height < self.attraction.min_height
            if error == ""
                error += "Sorry. You are not tall enough to ride the #{attraction.name}."
            else 
                error += " You are not tall enough to ride the #{attraction.name}."
            end 
        end 

        if error == ""
            self.user.happiness += self.attraction.happiness_rating
            self.user.nausea += self.attraction.nausea_rating
            self.user.save
        end 

        error

    end 
end
