require "rails_helper"

RSpec.describe "Mechanic Show Page" do
  before(:each) do
    @amusement_park_1 = AmusementPark.create!(name: "Fantasy Land", admission_cost: 20)

    @mechanic_1 = Mechanic.create!(name: "Tom", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Billy", years_experience: 1)
    @mechanic_3 = Mechanic.create!(name: "Mike", years_experience: 14)

    @ride_1 = @amusement_park_1.rides.create!(name: "Big Rollercoaster", thrill_rating: 8, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: "Lazy Carousel", thrill_rating: 1, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: "Tilt-A-Whirl", thrill_rating: 7, open: false)
    @ride_4 = @amusement_park_1.rides.create!(name: "Ferris Wheel", thrill_rating: 3, open: true)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_4)
  end

  describe "Show Page Display" do
    it "displays the mechanic's name, years experience, and the names of rides they work on" do
      require 'pry'; binding.pry
    end
  end
end