class RidesController < ApplicationController

  def update
    @ride = Ride.find(params[:id])
    mechanic = Mechanic.find(params[:mechanic_id])

    if mechanic.rides << @ride
      redirect_to mechanic_path(mechanic), notice: "Ride was successfully added to mechanic's workload."
    else
      redirect_to @ride, alert: "Failed to add ride to mechanic's workload."
    end
  end