require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "instance methods" do
    
    describe "#all_mechanics" do 
      it "selects all of a park's mechanics" do
        ap1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
        ap2 = AmusementPark.create!(name: "Disneyland", admission_cost: 100)
        ride1 = ap1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
        ride2 = ap1.rides.create!(name: "Teacups", thrill_rating: 1, open: true)
        ride3 = ap1.rides.create!(name: "Race Cars", thrill_rating: 5, open: true)
        ride4 = ap2.rides.create!(name: "Splash Mountain", thrill_rating: 5, open: true)
        mechanic1 = ride1.mechanics.create!(name: "Michelle Obama", years_experience: 11)
        mechanic2 = ride2.mechanics.create!(name: "Simon G", years_experience: 3)
        mechanic3 = ride3.mechanics.create!(name: "Jolene Dog", years_experience: 4)
        mechanic4 = ride4.mechanics.create!(name: "Betty White", years_experience: 15)

        expect(ap1.all_mechanics(ap1.name)).to eq([mechanic1, mechanic2, mechanic3])
      end
    end

    describe "#all_rides" do 
      it "selects all of a park's rides and the ride mechanics years of experience" do
        ap1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
        ap2 = AmusementPark.create!(name: "Disneyland", admission_cost: 100)
        ride1 = ap1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
        ride2 = ap1.rides.create!(name: "Teacups", thrill_rating: 1, open: true)
        ride3 = ap1.rides.create!(name: "Race Cars", thrill_rating: 5, open: true)
        ride4 = ap2.rides.create!(name: "Splash Mountain", thrill_rating: 5, open: true)
        mechanic1 = ride1.mechanics.create!(name: "Michelle Obama", years_experience: 11)
        mechanic2 = ride2.mechanics.create!(name: "Simon G", years_experience: 3)
        mechanic3 = ride3.mechanics.create!(name: "Jolene Dog", years_experience: 4)
        mechanic4 = ride4.mechanics.create!(name: "Betty White", years_experience: 15)

        expected_order = [ride1, ride3, ride2]
        expect(ap1.all_rides(ap1.id)).to eq(expected_order)
      end
    end
  end
end
