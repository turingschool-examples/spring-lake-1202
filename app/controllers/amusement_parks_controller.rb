class AmusementParksController < ApplicationController
  def show
    @ap = AmusementPark.find(params[:id])
    @mechanics = @ap.all_mechanics(@ap.name)
    @rides = @ap.all_rides(@ap.id)
  end
end
