require "rails_helper"

RSpec.describe "the mechanics show page" do
  let!(:amusement_park_1) { AmusementPark.create!(name: "Hershey Park", admission_cost: 50.00) }

  let!(:ride_1) { amusement_park_1.rides.create!(name: "Lightning Racer", thrill_rating: 7, open: true) }
  let!(:ride_2) { amusement_park_1.rides.create!(name: "Storm Runner", thrill_rating: 9, open: true) }
  let!(:ride_3) { amusement_park_1.rides.create!(name: "The Great Bear", thrill_rating: 6, open: true) }

  let!(:mechanic_1) { Mechanic.create!(name: "Sam Mills", years_experience: 10) }
  let!(:mechanic_2) { Mechanic.create!(name: "Kara Smith", years_experience: 11) }

  let!(:ride_mechanic_1) { RideMechanic.create!(ride: ride_1, mechanic: mechanic_1) }
  let!(:ride_mechanic_2) { RideMechanic.create!(ride: ride_2, mechanic: mechanic_1) }
  let!(:ride_mechanic_3) { RideMechanic.create!(ride: ride_3, mechanic: mechanic_2) }

  context "Mechanic 1" do
    before(:each) do
      visit "/mechanics/#{mechanic_1.id}"
    end

    it "displays the mechanic's name, years of experience, and the names of all the rides they are working on" do
      within("#mechanic-info") do
        expect(page).to have_content("Mechanic: #{mechanic_1.name}")
        expect(page).to have_content("Years of Experience: #{mechanic_1.years_experience}")
      end

      within("#current-rides") do
        expect(page).to have_content("Current rides they're working on:")
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
      end

      expect(page).not_to have_content(mechanic_2.name)
      expect(page).not_to have_content(ride_3.name)
    end

    it "displays a form to add a ride to their workload" do
      within("#add-ride") do
        expect(page).to have_content("Add a ride to workload:")
        expect(page).to have_content("Ride Id:")
        expect(page).to have_button("Submit")
      end

      fill_in "Ride Id:", with: ride_3.id
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")

      within("#current-rides") do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
      end
    end
  end

  context "Mechanic 2" do
    before(:each) do
      visit "mechanics/#{mechanic_2.id}"
    end

    it "displays the mechanic's name, years of experience, and the names of all the rides they are working on" do
      within("#mechanic-info") do
        expect(page).to have_content("Mechanic: #{mechanic_2.name}")
        expect(page).to have_content("Years of Experience: #{mechanic_2.years_experience}")
      end

      within("#current-rides") do
        expect(page).to have_content("Current rides they're working on:")
        expect(page).to have_content(ride_3.name)
      end

      expect(page).not_to have_content(mechanic_1.name)
      expect(page).not_to have_content(ride_1.name)
      expect(page).not_to have_content(ride_2.name)
    end

    it "displays a form to add a ride to their workload" do
      within("#add-ride") do
        expect(page).to have_content("Add a ride to workload:")
        expect(page).to have_content("Ride Id:")
        expect(page).to have_button("Submit")
      end

      fill_in "Ride Id:", with: ride_1.id
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{mechanic_2.id}")

      within("#current-rides") do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_3.name)
        expect(page).not_to have_content(ride_2.name)
      end
    end
  end
end
