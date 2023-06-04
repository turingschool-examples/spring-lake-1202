require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  before :each do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "John Doe", years_experience: 4)

    @park_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    @park_2 = AmusementPark.create!(name: "Cedar Point", admission_cost: 75)

    @ride_1 = Ride.create!(name: "Lightning Racer", thrill_rating: 7, open: true, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: "Storm Runner", thrill_rating: 9, open: true, amusement_park_id: @park_1.id)
    @ride_3 = Ride.create!(name: "The Great Bear", thrill_rating: 5, open: false, amusement_park_id: @park_2.id)
    @ride_4 = Ride.create!(name: "The Kiss Raise", thrill_rating: 2, open: false, amusement_park_id: @park_1.id)
    @ride_5 = Ride.create!(name: "Thunderbird", thrill_rating: 8, open: true, amusement_park_id: @park_2.id)

    @mechanic_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanic_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    @mechanic_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
    @mechanic_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)
    @mechanic_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_5.id)
  end

  describe "instance methods" do
    describe "#unique_mechanics" do
      it "returns a list of unique mechanics that work at the park" do
        expect(@park_1.unique_mechanics).to eq([@mechanic_2.name, @mechanic_1.name])
      end
    end
  end
end