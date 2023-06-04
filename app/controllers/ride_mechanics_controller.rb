class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    RideMechanic.create!(mechanic_id: params[:mechanic_id], ride_id: params[:ride_id])
    redirect_to "/mechanics/#{mechanic.id}"
  end
end