require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "class methods" do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
      @mechanic_2 = Mechanic.create!(name: "John Doe", years_of_experience: 6)
      @mechanic_3 = Mechanic.create!(name: "Jane Doe", years_of_experience: 12)
      @mechanic_4 = Mechanic.create!(name: "Michael Mechanix", years_of_experience: 1)

      @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @amusement_park_2 = AmusementPark.create!(name: "Knotts Berry Farm", admission_cost: 50)

      @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
      @ride_2 = @amusement_park_1.rides.create!(name: "The Frog Hopper", thrill_rating: 5, open: false)
      @ride_3 = @amusement_park_1.rides.create!(name: "Fahrenheit", thrill_rating: 4, open: false)
      @ride_4 = @amusement_park_1.rides.create!(name: "The Kiss Raise", thrill_rating: 1, open: false)

      @ride_5 = @amusement_park_2.rides.create!(name: "The Ride", thrill_rating: 7, open: false)
      @ride_6 = @amusement_park_2.rides.create!(name: "The Other Ride", thrill_rating: 5, open: false)
      @ride_7 = @amusement_park_2.rides.create!(name: "The Other Other Ride", thrill_rating: 4, open: false)
      @ride_8 = @amusement_park_2.rides.create!(name: "The Otherest Ride", thrill_rating: 1, open: false)

      @mechanic_1_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
      @mechanic_1_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
      @mechanic_1_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

      @mechanic_2_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)

      @mechanic_3_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_5.id)
      @mechanic_3_ride_6 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_6.id)
      @mechanic_4_ride_7 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_7.id)
      @mechanic_4_ride_8 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_8.id)
    end

    context "::amusement_park_rides" do
      it "returns a unique list of mechanics grouped by name that are working on rides at a given park" do
        expect(Mechanic.amusement_park_rides(@amusement_park_1.id)).to eq([@mechanic_1, @mechanic_2])
        expect(Mechanic.amusement_park_rides(@amusement_park_2.id)).to eq([@mechanic_3, @mechanic_4])
      end
    end
  end
end