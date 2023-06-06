class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:mechanic][:ride_id])

    mechanic_ride = MechanicRide.new(mechanic: @mechanic, ride: ride)

    if mechanic_ride.save
      redirect_to mechanic_path(@mechanic), notice: "Ride added to mechanic's workload."
    end
  end
end