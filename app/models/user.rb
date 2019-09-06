class User < ActiveRecord::Base
    has_secure_password
    has_many :rides 
    has_many :attractions, :through => :rides

    #validates :password, :presence => true

    def mood 
        #h = self.happiness
        #n = self.nausea
        #binding.pry
        if (nausea.to_f >= happiness.to_f) 
            #binding.pry
            "sad" 
        else 
            "happy" 
        end
    end
end

