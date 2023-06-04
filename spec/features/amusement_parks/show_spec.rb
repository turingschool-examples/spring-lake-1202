require "rails_helper" 

RSpec.describe "Amusement Park Show Page" do 
  before(:each) do 
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Karl Snith", years_experience: 11)
    @ride_1 = @six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @six_flags.rides.create!(name: "The UnFurler", thrill_rating: 7, open: false)
    @ride_3 = @six_flags.rides.create!(name: "The Spewer", thrill_rating: 7, open: false)
    @mech_rides = MechanicRide.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    @mech_rides = MechanicRide.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
    @mech_rides = MechanicRide.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_2.id)
  end
  it "has amusement park info" do 
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content("Name: #{@six_flags.name}")
    expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
  end
end