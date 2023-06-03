require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe " model methods " do 
    it "#current_mechanics" do
      mech = Mechanic.create!(name: "Austin Woods", years_experience: 12)
      mech2 = Mechanic.create!(name: "Jimmy J.", years_experience: 1)
      park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
      ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      ride_2 = park.rides.create!(name: "The Rocket", thrill_rating: 9, open: true)
      ride_3 = park.rides.create!(name: "The Ship", thrill_rating: 3, open: true)
      rm_1 = RideMechanic.create!(ride: ride_1, mechanic: mech)
      rm_2 = RideMechanic.create!(ride: ride_2, mechanic: mech2)
      rm_2 = RideMechanic.create!(ride: ride_3, mechanic: mech2)

      expect(park.current_mechanics).to eq([mech.name, mech2.name])
    end
  end
end