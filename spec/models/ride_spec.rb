require "rails_helper"

RSpec.describe Ride, type: :model do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @jelly = @six_flags.mechanics.create!(name: "Jelly Parlor", years_experience: 12)
    @josey = @six_flags.mechanics.create!(name: "Josey Jester", years_experience: 30)
    @janet = @six_flags.mechanics.create!(name: "Janet Joplin", years_experience: 1)

    @drop = @six_flags.rides.create!(name: 'The Drop', thrill_rating: 5, open: false) 
    @flight = @six_flags.rides.create!(name: 'In Flight', thrill_rating: 5, open: true) 
    
    RideMechanic.create!(ride_id: @drop.id, mechanic_id: @jelly.id)
    RideMechanic.create!(ride_id: @drop.id, mechanic_id: @josey.id)
    RideMechanic.create!(ride_id: @flight.id, mechanic_id: @jelly.id)
    RideMechanic.create!(ride_id: @flight.id, mechanic_id: @janet.id)
    RideMechanic.create!(ride_id: @flight.id, mechanic_id: @josey.id)
  end

  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "instance methods" do 
    it '#mechanic_avg_experience' do 
      expect(@drop.mechanic_avg_experience).to eq(21)
      expect(@flight.mechanic_avg_experience).to eq(14.33)
    end
  end
end