class User < ActiveRecord::Base
    has_many :rides 
    has_many :attractions, through: :rides
    has_secure_password

    def mood 
        return "" if nausea.nil? or happiness.nil?
        self.nausea > self.happiness ? 'sad' : 'happy'
    end
end
