class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find_by_id(params[:mechanic_id])
    RideMechanic.create!(ride_id: params[:ride_id], mechanic_id: params[:mechanic_id])
    redirect_to "/mechanics/#{mechanic.id}"
  end
end