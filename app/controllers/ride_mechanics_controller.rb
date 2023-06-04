class RideMechanicsController < ApplicationController
  def create
    @ride_mechanic = RideMechanic.create!(ride_mechanic_params)
    mechanic = @ride_mechanic.mechanic
    redirect_to "/mechanics/#{mechanic.id}"
  end

  private
  def ride_mechanic_params
    params.permit(:ride_id, :mechanic_id)
  end
end