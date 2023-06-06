# app/models/mechanic_ride.rb
class MechanicRide < ApplicationRecord
  belongs_to :mechanic
  belongs_to :ride
end
