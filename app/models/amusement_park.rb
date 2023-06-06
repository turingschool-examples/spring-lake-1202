class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :rides

  def mechanics_working
    rides.joins(:ride_mechanics, :mechanics)
    .select('mechanics.name')
    .distinct.pluck('mechanics.name')
  end

  def mechanic_average_exp
    rides.joins(:ride_mechanics, :mechanics)
    .select('rides.id, rides.name, AVG(mechanics.years_experience) as avg_exp')
    .group('rides.id')
    .order('avg_exp')
  end
end