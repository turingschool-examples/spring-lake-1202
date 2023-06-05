require "rails_helper"

RSpec.describe "Mechanic Show Page" do

  let!(:funland) { AmusementPark.create!(name: 'Funland', admission_cost: 20) }
  let!(:kennywood) { AmusementPark.create!(name: 'Kennywood', admission_cost: 25) }

  let!(:mechanic1) { Mechanic.create!(name: "Billy", years_experience: 5) }
  
  let!(:ride1) { funland.rides.create!(name: "Gravitron", thrill_rating: 7, open: true) }
  let!(:ride2) { funland.rides.create!(name: "Froghopper", thrill_rating: 4, open: true) }
  let!(:ride3) { funland.rides.create!(name: "Sea Dragon", thrill_rating: 2, open: true) }
  
  let!(:ride_mechanic1) { RideMechanic.create!(mechanic: mechanic1, ride: ride1) }
  let!(:ride_mechanic2) { RideMechanic.create!(mechanic: mechanic1, ride: ride2) }

  describe "Story 1" do
    it "displays mechanic's name, years of experience, and the names of all rides they are working on" do
      visit "/mechanics/#{mechanic1.id}"
      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_experience)
      
      within("#rides") do
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
      end
    end
  end

  describe "Story 2" do
    it "displays a form to add a ride to their workload" do
      visit "/mechanics/#{mechanic1.id}"
      expect(page).to have_content("Add a ride to their workload")
      expect(page).to have_button("Add ride")
      fill_in(:ride_id, with: ride3.id)
      click_button("Add ride")

      expect(page).to have_content(ride3.name)
      
      
    end
  end
end
# expect(current_path).to eq("/mechanics/#{mechanic1.id}")