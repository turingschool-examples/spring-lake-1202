class Mechanics::RidesController < ApplicationController 
  def create
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    MechanicRide.create!(mechanic: @mechanic, ride: @ride)
    redirect_to mechanic_path(@mechanic)
  end
end