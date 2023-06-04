require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  before(:each) do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @tea_cup = @six_flags.rides.create!(name: 'Tea Cup Ride', thrill_rating: 3, open: true)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic_1 = Mechanic.create!(name: "Amy S", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Vivian V", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Penny V", years_experience: 8)

    @mechanic_1.rides << [@hurler, @scrambler]
    @mechanic_2.rides << [@hurler, @tea_cup]
  
  end
  describe "relationships" do
    it { should have_many(:rides) }
    it {should have_many(:ride_mechanics).through(:rides)}
    it {should have_many(:mechanics).through(:ride_mechanics)}

  end

  describe "List mechanics of park rides " do
    it "::lists_mechanics" do

      expect(@six_flags.lists_mechanics).to eq([@mechanic_1, @mechanic_2])
    end
  end
end