require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "instance methods" do
    
    describe "#all_rides" do 
      it "selects all of a mechanic's rides" do
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

        expect(mechanic1.all_rides(mechanic1.name)).to eq([ride1])
      end
    end
  end
end
