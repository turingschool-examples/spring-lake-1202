class RideMechanicsController < ApplicationController
  def create
    require 'pry'; binding.pry
    RideMechanic.create!(ride_mechanic_params)
    redirect_to "/mechanics/#{ride_mechanic_params[:mechanic_id]}"
  end

  private

  def ride_mechanic_params
    params.permit(:mechanic_id, :ride_id)
  end
end