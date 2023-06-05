class Mechanic < ApplicationRecord
  belongs_to :ride
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def rides_working_on
    self.rides.pluck(:name)
  end
end