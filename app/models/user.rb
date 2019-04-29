class User < ActiveRecord::Base
    has_secure_password
    validates :name, uniqueness: true
    has_many :rides
    has_many :attractions, through: :rides



    def mood
        if self.present?
            if self.nausea > self.happiness
             mood = "sad"
            else
             mood = "happy"
            end
        end
    end
end
