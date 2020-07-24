class User < ActiveRecord::Base
    has_secure_password
    validates :name, uniqueness: true
    has_many :rides
    has_many :attractions, through: :rides

    


    def mood
        if self.present? && self.admin == false
            if self.happiness > self.nausea
             return "happy"
            else
             return "sad"
            end
        end
    end
end
