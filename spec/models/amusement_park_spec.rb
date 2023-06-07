require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @mike = Mechanic.create!(name: "Mike", years_experience: 3)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @mike_hurler = MechanicsRide.create!(ride: @hurler, mechanic: @mike)
    @mike_scrambler = MechanicsRide.create!(ride: @scrambler, mechanic: @mike)
    @mike_ferris = MechanicsRide.create!(ride: @ferris, mechanic: @mike)

    @bob = Mechanic.create!(name: "Bob", years_experience: 10)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    @pukie = @universal.rides.create!(name: 'The Pukie', thrill_rating: 9, open: true)
    @rattler = @universal.rides.create!(name: 'The Rattler', thrill_rating: 8, open: true)

    @bob_jaws = MechanicsRide.create!(ride: @jaws, mechanic: @bob)
    @bob_pukie = MechanicsRide.create!(ride: @pukie, mechanic: @bob)
    @bob_rattler = MechanicsRide.create!(ride: @rattler, mechanic: @bob)
  end

  describe "instance methods" do 
    describe "#men_at_work" do 
      it "returns a list of mechanics who are working on a ride at that park" do 
        expect(@six_flags.men_at_work).to eq([@mike])
        expect(@universal.men_at_work).to eq([@bob])

        # @mike_jaws = MechanicsRide.create!(ride: @jaws, mechanic: @mike)
        # expect(@universal.men_at_work).to eq([@bob.name, @mike])
      end
    end
  end
end