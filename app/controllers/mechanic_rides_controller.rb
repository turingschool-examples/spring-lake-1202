class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    mechanic_ride = MechanicRide.create!(mechanic_ride_params)

    redirect_to "/mechanics/#{mechanic.id}"
  end

  private
  def mechanic_ride_params
    params.permit(:ride_id, :mechanic_id)
  end
end