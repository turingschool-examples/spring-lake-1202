class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @park_mechs = @park.list_of_mechanics
  end
end