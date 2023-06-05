class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:id])
    @mechanic.rides = ride
    @mechanic.save
    redirect_to "/mechanic/#{@mechanic.id}"
  end

  private
  def ride_params
    params.permit(:name, :thrill_rating, :open)
  end
end