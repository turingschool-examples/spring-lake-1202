class AmusementPark < ApplicationRecord
  has_many :rides

  def unique_mechanics
    rides.joins(:mechanics).distinct.pluck('mechanics.name')
  end
end