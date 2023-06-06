require "rails_helper"

RSpec.describe "mechanic_rides#new" do
  let!(:ap_1) { AmusementPark.create!(name: "Wally World", admission_cost: 50) }
  let!(:ride_1) { ap_1.rides.create!(name: "Rattler", thrill_rating: 5, open: true) }
  let!(:ride_2) { ap_1.rides.create!(name: "Lazy River", thrill_rating: 1, open: true) }
  let!(:ride_3) { ap_1.rides.create!(name: "Thunder Mountain RR", thrill_rating: 10, open: true) }
  let!(:mechanic_1) { Mechanic.create!(name: "Bubba Gump", years_experience: 10) }

  let!(:ride_mechanic_1) { RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id) }
  let!(:ride_mechanic_2) { RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id) }

  it "can add a new ride to the mechanic's workload" do
    visit mechanic_path(mechanic_1)

    expect(page).to have_field("Ride ID:")
    expect(page).to have_button("Add Ride")
  end

  it "adds a ride to the mechanic's page" do
    visit mechanic_path(mechanic_1)

    fill_in "Ride ID:", with: ride_3.id

    click_button "Add Ride"

    expect(page).to have_content(ride_3.name)
    save_and_open_page
  end
end