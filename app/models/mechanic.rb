class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  has_many :amusement_parks, through: :rides

  validates_presence_of :name
  validates_presence_of :years_experience
end