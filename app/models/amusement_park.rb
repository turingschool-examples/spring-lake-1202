class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :rides

  def mechanics_working
    rides.joins(:ride_mechanics, :mechanics)
    .select('mechanics.name')
    .distinct.pluck('mechanics.name')
  end
end