require "rails_helper"

RSpec.describe "/mechanics/:id" do
  describe 'As a visitor' do
    describe 'when I visit the mechanics show page' do
      # Story 1 - Mechanic Show Page

      # As a user,
      # When I visit a mechanic show page
      # I see their name, years of experience, and the names of all rides they are working on.
      let!(:park_1) { AmusementPark.create!(name: "Six Flags", admission_cost: 75) }

      let!(:mechanic_1) { Mechanic.create!(name: "Joey", years_experience: 7) }
      let!(:mechanic_2) { Mechanic.create!(name: "Jazelle", years_experience: 9) }

      let!(:ride_1) { Ride.create!(name: "Cannonball", thrill_rating: 6, open: true, amusement_park_id: park_1.id ) }
      let!(:ride_2) { Ride.create!(name: "Batman", thrill_rating: 8, open: true, amusement_park_id: park_1.id) }
      let!(:ride_3) { Ride.create!(name: "Life", thrill_rating: 20, open: false, amusement_park_id: park_1.id) }

      let!(:ride_mec_1) { RideMechanic.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id) }
      let!(:ride_mec_2) { RideMechanic.create!(mechanic_id: mechanic_1.id, ride_id: ride_2.id) }
      let!(:ride_mec_3) { RideMechanic.create!(mechanic_id: mechanic_2.id, ride_id: ride_3.id) }

      it 'displays their name, years of experience and all rides they are working on' do
        visit "/mechanics/#{mechanic_1.id}"
        expect(page).to have_content("Name: #{mechanic_1.name}")
        expect(page).to have_content("Years Experience: #{mechanic_1.years_experience}")
        expect(page).to have_content("Rides #{mechanic_1.name} Is Working On")
        expect(page).to_not have_content("Name: #{mechanic_2.name}")

        within "#mec-rides-#{mechanic_1.id}" do
          expect(page).to have_content("Ride Name: #{ride_1.name}")
          expect(page).to have_content("Ride Name: #{ride_2.name}")
          expect(page).to_not have_content("Ride Name: #{ride_3.name}")
          expect(page).to_not have_content("Name: #{mechanic_2.name}")
        end

        visit "/mechanics/#{mechanic_2.id}"
        expect(page).to have_content("Name: #{mechanic_2.name}")
        expect(page).to have_content("Years Experience: #{mechanic_2.years_experience}")
        expect(page).to have_content("Rides #{mechanic_2.name} Is Working On")
        expect(page).to_not have_content("Name: #{mechanic_1.name}")

        within "#mec-rides-#{mechanic_2.id}" do
          expect(page).to have_content("Ride Name: #{ride_3.name}")
          expect(page).to_not have_content("Ride Name: #{ride_1.name}")
          expect(page).to_not have_content("Ride Name: #{ride_2.name}")
          expect(page).to_not have_content("Name: #{mechanic_1.name}")
        end


      end
    end
  end
end