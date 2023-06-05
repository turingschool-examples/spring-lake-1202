require "rails_helper"

RSpec.describe Ride, type: :model do
  before(:each) do
    test_data
  end

  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics)}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe "#avg_exp" do
    it "can determine average experience of mechanics for a ride" do
      expect(@ride1.avg_exp).to eq(25.5)
    end
  end
end