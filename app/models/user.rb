class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :rides, through: :attractions

    #create rides and attractions tables to be able to have assocations.
end
