class AmusementPark < ApplicationRecord
  has_many :rides

  validates_presence_of :name, :admission_cost

  def mechanics_working_on_rides
    Mechanic.joins(:rides).where(rides: {amusement_park_id: id}).distinct
  end
end