class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_ride][:mechanic_id])
    mechanic_ride = MechanicRide.new(mechanic_ride_params)
    if mechanic_ride.save
      redirect_to "/mechanics/#{mechanic.id}"
    else
      redirect_to "/mechanics/#{mechanic.id}"
    end
  end

  private

  def mechanic_ride_params
    params.required(:mechanic_ride).permit(:mechanic_id, :ride_id)
  end
end