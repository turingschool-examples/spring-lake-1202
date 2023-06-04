require "rails_helper"

RSpec.describe "/amusement_parks/:id" do
  describe "Amusement Park Show Page" do
    let!(:park) { AmusementPark.create!(name: "Wally World", admission_cost: 50)}

    let!(:mechanic_1) { Mechanic.create!(name: "Busta Rhymes", years_experience: 42) }
    let!(:ride_1) { park.rides.create!(name: "Spin Spin Spin", thrill_rating: 10, open: true) }
    let!(:ride_2) { park.rides.create!(name: "Crazy Train", thrill_rating: 5, open: true) }
    let!(:ride_3) { park.rides.create!(name: "Joy Ride", thrill_rating: 1, open: false) }
    let!(:ride_mechanic_1) { RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)}
    let!(:ride_mechanic_2) { RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)}
    let!(:ride_mechanic_3) { RideMechanic.create!(ride: ride_3, mechanic: mechanic_1)}

    let!(:mechanic_2) { Mechanic.create!(name: "Ozzy Ozborn", years_experience: 2) }
    let!(:ride_4) { park.rides.create!(name: "Out of Service", thrill_rating: 10, open: true) }
    let!(:ride_mechanic_4) { RideMechanic.create!(ride: ride_4, mechanic: mechanic_2)}

    let!(:park_2) { AmusementPark.create!(name: "Coolest Place", admission_cost: 10000)}
    let!(:mechanic_3) { Mechanic.create!(name: "Busta Rhymes", years_experience: 42) }
    let!(:ride_5) { park_2.rides.create!(name: "Spin Spin Spin", thrill_rating: 10, open: true) }    
    let!(:ride_mechanic_5) { RideMechanic.create!(ride: ride_5, mechanic: mechanic_3)}

    it "displays the amusement parks attributes" do
      visit "/amusement_parks/#{park.id}"

      expect(page).to have_content("#{park.name}")
      expect(page).to have_content("Price of Admission: #{park.admission_cost}")
    end

    it "displays a unique list of names of all the mechanics working on the parks rides" do
      visit "/amusement_parks/#{park.id}"

      within ".park_#{park.id}_mechanics" do
        expect(page).to have_content("#{mechanic_1.name}")
        expect(page).to have_content("#{mechanic_2.name}")
        expect(page).to_not have_content("#{mechanic_3.name}")
      end
    end
  end
end