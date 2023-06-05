class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
