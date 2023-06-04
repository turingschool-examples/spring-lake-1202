class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def new
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    mechanic = Mechanic.find(params[:id])
    require 'pry'; binding.pry
    ride = Ride.create!(ride_params)
  end

  private

  def ride_params
    params.permit(:name, :thrill_rating, :open)
  end
end