class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :rides

  def park_mechanics
    rides.joins(:ride_mechanics, :mechanics).select("mechanics.nam").distinct.pluck("mechanics.name")
  end
end