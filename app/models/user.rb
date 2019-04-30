class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  before_save :default_values

  def default_values
    self.admin ||= 'false'
  end

  def mood
    self.happiness > self.nausea ? 'happy' : 'sad'
  end
end
