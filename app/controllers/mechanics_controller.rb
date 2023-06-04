class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.all_rides(@mechanic.name)
  end

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:add_ride])
    RideMechanic.create!(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
