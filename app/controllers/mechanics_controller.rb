class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])

    if @mechanic.rides << @ride
      redirect_to mechanic_path(@mechanic), notice: "Ride was successfully added to mechanic's workload."
    else
      redirect_to mechanic_path(@mechanic), alert: "Failed to add ride to mechanic's workload."
    end
  end
end

