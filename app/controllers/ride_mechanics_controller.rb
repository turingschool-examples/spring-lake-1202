class RideMechanicsController < ApplicationController
  def create
    ride_mechanics = RideMechanic.create!(ride_mechanic_params)
    redirect_back fallback_location: "/mechanics"
  end

  private
    def ride_mechanic_params
      params.permit(:mechanic_id, :ride_id)
    end
end