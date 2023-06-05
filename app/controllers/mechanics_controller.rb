class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
  
  def update
    @mechanic = Mechanic.find(params[:id])
    @Ride = Ride.find(params[:id])
    @mechanic.ride.update(ride_params)
    redirect_to "/mechanic/#{@mechanic.id}"
  end

  private
  def ride_params
    params.permit(:name, :thrill_rating, :open)
  end
end