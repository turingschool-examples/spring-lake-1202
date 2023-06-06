require "rails_helper"

RSpec.describe "mechanic#show" do
  let!(:ap_1) { AmusementPark.create!(name: "Wally World", admission_cost: 50) }
  let!(:ride_1) { ap_1.rides.create!(name: "Rattler", thrill_rating: 5, open: true) }
  let!(:ride_2) { ap_1.rides.create!(name: "Lazy River", thrill_rating: 1, open: true) }
  let!(:ride_3) { ap_1.rides.create!(name: "Thunder Mountain RR", thrill_rating: 10, open: true) }
  let!(:mechanic_1) { Mechanic.create!(name: "Bubba Gump", years_experience: 10) }

  let!(:ride_mechanic_1) { RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id) }
  let!(:ride_mechanic_2) { RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id) }

  it "should display the mechanic and its attributes" do
    visit "mechanics/#{mechanic_1.id}" do
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_experience)
    end
  end

  it "shows the names of all the rides they work on" do
    visit "mechanics/#{mechanic_1.id}"
    save_and_open_page
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
  end

end