class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @mechanics = @park.list_mechanics
  end
end