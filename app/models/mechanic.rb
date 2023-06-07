class Mechanic < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :rides, through: :ride_mechanics
end
