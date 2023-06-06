require "rails_helper"

RSpec.describe "mechanic#show" do
  let!(:ap_1) { AmusementPark.create!(name: "Wally World", admission_cost: 50) }
  let!(:ride_1) { ap_1.rides.create!(name: "Rattler", thrill_rating: 5, open: true) }
  let!(:ride_2) { ap_1.rides.create!(name: "Lazy River", thrill_rating: 1, open: true) }
  let!(:ride_3) { ap_1.rides.create!(name: "Thunder Mountain RR", thrill_rating: 10, open: true) }
  let!(:mechanic_1) { Mechanic.create!(name: "Bubba", years_experience: 10) }

  let!(:ride_mechanic_1) { RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id) }
  let!(:ride_mechanic_2) { RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id) }

    # Story 1 - Mechanic Show Page

    # As a user,
    # When I visit a mechanic show page
    # I see their name, years of experience, and the names of all rides they are working on.
  it "should display the mechanic and its attributes" do
    visit "mechanics/#{mechanic_1.id}"
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end
end