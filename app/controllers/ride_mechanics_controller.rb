class RideMechanicsController < ApplicationController
  def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:mechanic_id])

    RideMechanic.create!(ride: ride, mechanic: mechanic)
    redirect_to mechanic_path(mechanic)
  end
end
