require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  before(:each) do
    test_data
  end
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics).through(:rides)}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe "class methods" do
    describe ".park_mechanics" do
      it "can create a unique list of mechanics working at this park" do
        expect(@disney.park_mechanics).to eq([@mech3, @mech4])
        expect(@six_flags.park_mechanics).to eq([@mech1, @mech2])
      end
    end
  end
end