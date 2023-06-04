require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "#instance methods" do
    let!(:park) { AmusementPark.create!(name: "Wally World", admission_cost: 50)}

    let!(:mechanic_1) { Mechanic.create!(name: "Busta Rhymes", years_experience: 42) }
    let!(:ride_1) { park.rides.create!(name: "Spin Spin Spin", thrill_rating: 10, open: true) }
    let!(:ride_2) { park.rides.create!(name: "Crazy Train", thrill_rating: 5, open: true) }
    let!(:ride_3) { park.rides.create!(name: "Joy Ride", thrill_rating: 1, open: false) }
    let!(:ride_mechanic_1) { RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)}
    let!(:ride_mechanic_2) { RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)}
    let!(:ride_mechanic_3) { RideMechanic.create!(ride: ride_3, mechanic: mechanic_1)}

    let!(:mechanic_2) { Mechanic.create!(name: "Ozzy Ozborn", years_experience: 2) }
    let!(:ride_4) { park.rides.create!(name: "Out of Service", thrill_rating: 10, open: true) }
    let!(:ride_mechanic_4) { RideMechanic.create!(ride: ride_4, mechanic: mechanic_2)}

    let!(:park_2) { AmusementPark.create!(name: "Wally World", admission_cost: 50)}
    let!(:mechanic_3) { Mechanic.create!(name: "Busta Rhymes", years_experience: 42) }
    let!(:ride_5) { park_2.rides.create!(name: "Spin Spin Spin", thrill_rating: 10, open: true) }    
    let!(:ride_mechanic_5) { RideMechanic.create!(ride: ride_5, mechanic: mechanic_3)}

    it "returns a unique list of the parks mechanics" do
      original = [mechanic_1, mechanic_2, mechanic_3]
      expected = [mechanic_1, mechanic_2]

      expect(Mechanic.all).to eq(original)
      expect(park.uniq_mechanics).to eq(expected)
    end
  end
end