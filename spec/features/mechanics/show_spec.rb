require 'rails_helper'

RSpec.describe "Mechanic Show Page" do 
  describe "Mechanic's attributes" do
    it "shows a mechanic's attributes" do
      mech = Mechanic.create!(name: "Austin Woods", years_experience: 12)
      park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
      ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      ride_2 = park.rides.create!(name: "The Rocket", thrill_rating: 9, open: true)
      rm_1 = RideMechanic.create!(ride: ride_1, mechanic: mech)
      rm_2 = RideMechanic.create!(ride: ride_2, mechanic: mech)

      visit "/mechanics/#{mech.id}"

      expect(page).to have_content(mech.name)
      expect(page).to have_content(mech.years_experience)
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
    end
    
    it "can add a ride to a mechanic" do
      mech = Mechanic.create!(name: "Austin Woods", years_experience: 12)
      park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
      ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      ride_2 = park.rides.create!(name: "The Rocket", thrill_rating: 9, open: true)
      rm_1 = RideMechanic.create!(ride: ride_1, mechanic: mech)
      visit "/mechanics/#{mech.id}"

      expect(page).to_not have_content(ride_2.name)

      fill_in :ride_id, with: ride_2.id
      click_button "Submit"
  
      expect(current_path).to eq("/mechanics/#{mech.id}")
  
      expect(page).to have_content(ride_2.name)
    end
  end
end