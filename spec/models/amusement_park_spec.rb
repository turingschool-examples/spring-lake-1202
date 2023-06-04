require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :admission_cost}
  end

  before(:each) do
    @amusement_park_1 = AmusementPark.create!(name: "Fantasy Land", admission_cost: 20)
    @amusement_park_2 = AmusementPark.create!(name: "Disney World", admission_cost: 400)

    @mechanic_1 = Mechanic.create!(name: "Tom", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Billy", years_experience: 1)
    @mechanic_3 = Mechanic.create!(name: "Mike", years_experience: 14)
    @mechanic_4 = Mechanic.create!(name: "Bob", years_experience: 3)
    @mechanic_5 = Mechanic.create!(name: "Kelly", years_experience: 7)

    @ride_1 = @amusement_park_1.rides.create!(name: "Big Rollercoaster", thrill_rating: 8, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: "Lazy Carousel", thrill_rating: 1, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: "Tilt-A-Whirl", thrill_rating: 7, open: false)
    @ride_4 = @amusement_park_1.rides.create!(name: "Ferris Wheel", thrill_rating: 3, open: true)
    @ride_5 = @amusement_park_2.rides.create!(name: "Small World", thrill_rating: 4, open: true)
    @ride_6 = @amusement_park_2.rides.create!(name: "Pirate Cavern", thrill_rating: 5, open: false)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_4, ride: @ride_5)
    MechanicRide.create!(mechanic: @mechanic_5, ride: @ride_6)
    MechanicRide.create!(mechanic: @mechanic_5, ride: @ride_6)
  end

  describe "Instance Methods" do
    describe "#mechanics_working_on_rides" do
      it "returns the unique mechanics that are working on a park's rides" do
        expect(@amusement_park_1.mechanics_working_on_rides).to include(@mechanic_1, @mechanic_2, @mechanic_3)
        expect(@amusement_park_1.mechanics_working_on_rides).to_not include(@mechanic_4, @mechanic_5)

        expect(@amusement_park_2.mechanics_working_on_rides).to include(@mechanic_4, @mechanic_5)
        expect(@amusement_park_2.mechanics_working_on_rides).to_not include(@mechanic_1, @mechanic_2, @mechanic_3)
      end
    end
  end
end