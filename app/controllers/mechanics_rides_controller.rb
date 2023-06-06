class MechanicsRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    if Ride.find(params[:ride_id]).nil?
      redirect_to "/mechanics/#{mechanic.id}"
      flash[:alert] = "Error: #{error_message(mechanics_ride.errors)}"
    elsif Ride.find(params[:ride_id]) != nil
      ride = Ride.find(params[:ride_id])
    end
    mechanics_ride = MechanicsRide.new(mechanic: mechanic, ride: ride)
    if mechanics_ride.save
      redirect_to "/mechanics/#{mechanic.id}"
    else
      redirect_to "/mechanics/#{mechanic.id}"
      flash[:alert] = "Error: #{error_message(mechanics_ride.errors)}"
    end
  end
end