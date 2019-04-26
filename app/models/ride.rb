class Ride < ApplicationRecord
    belongs_to :attractions
    belongs_to :users
end
