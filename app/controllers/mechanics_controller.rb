class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = @mechanic.rides
    @ride = Ride.all
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    redirect_to mechanic_path(@mechanic)
  end
end