class User < ActiveRecord::Base
    has_secure_password
    has_many :rides 
    has_many :attractions, :through => :rides

    validates :password, :presence => true

    def mood 
        h = self.happiness
        n = self.nausea
        if n > h 
            "sad" 
        elsif h > n 
            "happy" 
        end
    end
end

