class AmusementPark < ApplicationRecord
  has_many :rides

  def mechanics_working_on_rides
    Mechanic.joins(:mechanic_rides).where(mechanic_rides: { ride_id: self.rides })
  end
end