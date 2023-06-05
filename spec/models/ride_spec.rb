require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics)}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe "instance methods" do
    describe "#avg_exp" do
      it "can determine average experience of mechanics for a ride" do
        
      end
    end
  end
end