require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "instance methods" do
    before(:each) do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      @fun = AmusementPark.create!(name: 'Fun World', admission_cost: 1800)

      @scary = @fun.rides.create!(name: 'Super Scary', thrill_rating: 17, open: true)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      @toys = @universal.rides.create!(name: 'Toy Story', thrill_rating: 3, open: false)

      @suzie = Mechanic.create!(name: 'Suzie Smalls', years_experience: 2)
      @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      @bob = Mechanic.create!(name: 'Bobby Brown', years_experience: 27)

      @ride_mech_1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @suzie.id)
      @ride_mech_2 = RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @suzie.id)

      @ride_mech_3 = RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @kara.id)
      @ride_mech_4 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @kara.id)
      @ride_mech_5 = RideMechanic.create!(ride_id: @toys.id, mechanic_id: @kara.id)

      @ride_mech_6 = RideMechanic.create!(ride_id: @toys.id, mechanic_id: @bob.id)
      @ride_mech_7 = RideMechanic.create!(ride_id: @jaws.id, mechanic_id: @bob.id)
    end

    it "#list_mechanics" do
      expect(@universal.list_mechanics).to eq([@kara, @bob])
      expect(@universal.list_mechanics).to_not eq([@kara, @bob, @bob])
      expect(@six_flags.list_mechanics).to eq([@suzie, @kara])
      expect(@fun.list_mechanics).to eq([])
    end
  end
end