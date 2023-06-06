class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    ride_mech = RideMechanic.create!(ride_mechanic_params)
    redirect_to mechanic_path(mechanic)
  end

    private
    def ride_mechanic_params
      params.permit(:ride_id, :mechanic_id)
    end
end