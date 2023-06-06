class RideMechanicsController < ApplicationController
  def create
    @new_ride = RideMechanic.create!(ride_id: params[:ride_id], mechanic_id: params[:mechanic_id])
    @mechanic = Mechanic.find(params[:mechanic_id])
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end