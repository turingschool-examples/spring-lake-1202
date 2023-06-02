class RideMechanic < ApplicationRecord
  belongs_to :ride
  belongs_to :mechanic

  validates_presence_of :ride_id
  validates_presence_of :mechanic_id
end