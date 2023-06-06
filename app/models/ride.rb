class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def mechanic_avg_experience
    mechanics.average(:years_experience).round(2)
  end
end