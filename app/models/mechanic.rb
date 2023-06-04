class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.amusement_park_rides(park_id)
    joins(:rides).where("amusement_park_id = #{park_id}").group(:id)
  end
end