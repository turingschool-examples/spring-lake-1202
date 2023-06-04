class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_ride = MechanicRide.new
  end
end