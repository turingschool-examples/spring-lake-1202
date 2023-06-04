class MechanicsController < ApplicationController

  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = @mechanic.rides
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    @mechanic.rides << Ride.find(params[:ride_id])
    redirect_to "/mechanics/#{params[:id]}"
  end
end