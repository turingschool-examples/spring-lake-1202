require "rails_helper"

RSpec.describe "/mechanics/:id" do
  describe "Mechanics Show Page" do
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

    it "displays a specific mechanics YOE, and Rides they work on" do
      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content("#{mechanic_1.name}")
      expect(page).to have_content("Years Experience: #{mechanic_1.years_experience}")

      within ".mechanic_#{mechanic_1.id}_rides" do
        expect(page).to have_content("Rides Working On:")
        expect(page).to have_content("#{ride_1.name}")
        expect(page).to have_content("#{ride_2.name}")
        expect(page).to have_content("#{ride_3.name}")
      end
    end

    it "displays a form to add a ride for the mechanic" do
      visit "/mechanics/#{mechanic_1.id}"

      within ".mechanic_#{mechanic_1.id}_rides" do
        expect(page).to have_content("Rides Working On:")
        expect(page).to have_content("#{ride_1.name}")
        expect(page).to have_content("#{ride_2.name}")
        expect(page).to have_content("#{ride_3.name}")

        expect(page).to_not have_content("#{ride_4.name}")
      end

      within ".add_ride_to_mechanic_#{mechanic_1.id}" do
        fill_in :ride_id, with: ride_4.id
        click_button("Add Ride")
      end

      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")

      within ".mechanic_#{mechanic_1.id}_rides" do
      expect(page).to have_content("Rides Working On:")
      expect(page).to have_content("#{ride_1.name}")
      expect(page).to have_content("#{ride_2.name}")
      expect(page).to have_content("#{ride_3.name}")

      expect(page).to have_content("#{ride_4.name}")
      save_and_open_page
    end
    end
  end
end