class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def distinct_mechanics
    mechanics.distinct
  end

  def avg_mech_rides
    Ride.joins(:mechanics)
    .select("rides.*, avg(mechanics.years_experience) AS avg_years")
    .group(:id)
    .order("avg_years desc")
  end
end