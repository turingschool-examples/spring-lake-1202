class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @mechanics = @amusement_park.mechanics_working_on_rides
  end
end