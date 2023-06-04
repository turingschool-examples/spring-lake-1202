require "rails_helper"

RSpec.describe "Mechanics Show Page" do 
  it "lists mechanic info" do 
    six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    mechanic_2 = Mechanic.create!(name: "Karl Snith", years_experience: 11)
    ride_1 = six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = six_flags.rides.create!(name: "The UnFurler", thrill_rating: 7, open: false)
    ride_3 = six_flags.rides.create!(name: "The Spewer", thrill_rating: 7, open: false)
    mech_rides = MechanicRide.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id)
    mech_rides = MechanicRide.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id)
    mech_rides = MechanicRide.create!(ride_id: ride_3.id, mechanic_id: mechanic_2.id)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to_not have_content(ride_3.name)

  end
end