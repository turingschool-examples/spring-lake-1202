require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "validations" do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :admission_cost}
  end

  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "instance method" do 
    it "#mechanics_on_rides" do 
      @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
      @mechanic_2 = Mechanic.create!(name: "Karl Snith", years_experience: 11)
      @ride_1 = @six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
      @ride_2 = @six_flags.rides.create!(name: "The UnFurler", thrill_rating: 7, open: false)
      @ride_3 = @six_flags.rides.create!(name: "The Spewer", thrill_rating: 7, open: false)
      @mech_rides = MechanicRide.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
      @mech_rides = MechanicRide.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
      @mech_rides = MechanicRide.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_2.id)
      mechs = @six_flags.mechanics_on_rides.map { |mechanic| mechanic }
      
      expect(mechs).to eq([@mechanic_1.name, @mechanic_2.name])
    end
  end
end