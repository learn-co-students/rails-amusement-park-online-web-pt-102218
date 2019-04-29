class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
        u = User.find_by(id: self.user_id)
        a = Attraction.find_by(id:self[:attraction_id]) 
        if u.tickets >= a.tickets && u.height >= a.min_height 
            u.tickets = u.tickets - a.tickets 
            u.save 
        elsif u.tickets < a.tickets && u.height < a.min_height
            "Sorry. You do not have enough tickets to ride the #{a.name}. You are not tall enough to ride the #{a.name}."
        elsif u.height < a.min_height
            "Sorry. You are not tall enough to ride the #{a.name}."
        elsif u.tickets < a.tickets 
            "Sorry. You do not have enough tickets to ride the #{a.name}."
        end 
    end 
end
