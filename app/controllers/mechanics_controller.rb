class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    MechanicRide.create!(ride_id: @ride.id, mechanic_id: @mechanic.id)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end