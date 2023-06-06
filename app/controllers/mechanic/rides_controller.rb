class Mechanic::RidesController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    @ride = Ride.find(params[:ride_id])

    @mechanic.rides << @ride

    redirect_to mechanic_path(@mechanic)
  end

  private

  def ride_params
    params.require(:mechanic).permit(:ride_id)
  end


end
