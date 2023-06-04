class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_cost
  has_many :rides


  def mechanics_on_rides
    Mechanic.joins(:rides)
            .where(rides: { amusement_park_id: id})
            .distinct
            .pluck(:name)
  end
end