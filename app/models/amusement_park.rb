class AmusementPark < ApplicationRecord
  has_many :rides

  def all_mechanics(park_name)
    Mechanic.joins(ride_mechanics: { ride: :amusement_park }).where(amusement_parks: { name: park_name }).distinct
  end
end