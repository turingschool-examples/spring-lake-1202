class AmusementParksController < ApplicationController
  def show
    @ap = AmusementPark.find(params[:id])
    @mechanics = @ap.all_mechanics(@ap.name)
  end
end
