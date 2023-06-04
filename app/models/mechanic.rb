class Mechanic < ApplicationRecord
  validates_presence_of :name, :years_experience
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

end