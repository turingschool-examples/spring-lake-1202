class AmusementPark < ApplicationRecord
  has_many :rides

  def current_mechanics
    self.rides.joins(mechanics: [:ride_mechanics])
    .distinct
    .pluck("mechanics.name")
  end
end