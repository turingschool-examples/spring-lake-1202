class Mechanic < ApplicationRecord
  belongs_to :ride
  
  def rides_working_on
    self.ride.name
  end
end