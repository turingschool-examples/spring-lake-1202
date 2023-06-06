class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:amusement_park_id])
    @mechanics = @park.park_mechanics
  end
end