class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def all_rides(mechanic)
    Ride.joins(:mechanics).where(mechanics: { name: mechanic })
  end
end
