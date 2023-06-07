class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    ride = Ride.find(ride_params)
    if ride.save
      redirect_to "/mechanics/#{@mechanic.id}"
    else
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end

  private

  def ride_params
    params.permit(:id)
  end
end
