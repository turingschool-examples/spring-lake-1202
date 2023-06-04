require "rails_helper"

RSpec.describe "/mechanics/:id/new" do
  describe 'as a visitor' do
    describe 'when im sent to the new ride form' do
      let!(:park_1) { AmusementPark.create!(name: "Six Flags", admission_cost: 75) }

      let!(:mechanic_1) { Mechanic.create!(name: "Joey", years_experience: 7) }

      xit 'displays a form to add a new ride to workload' do
        visit "/mechanics/#{mechanic_1.id}/new"
        fill_in("Ride Name:", with: "More Work")
        fill_in("Thrill Rating:", with: 1)
        check("Open:")
        click_button("Submit Ride")

        expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
        # visit "/mechanics/#{mechanic_1.id}"
        # within "#mec-rides-#{mechanic_1.id}" do
        #   expect(page).to have_content("Ride Name: More Work")
        #   expect(page).to have_content("Thrill Rating: 1")
        #   expect(page).to have_content("Open: #{true}")
        # end
      end
    end
  end
end



      # Story 2 - Add a Ride to a Mechanic (display)

      # As a user,
      # When I go to a mechanic's show page
      # I see a form to add a ride to their workload
      # When I fill in that field with an id of an existing ride and click Submit
      # I’m taken back to that mechanic's show page
      # And I see the name of that newly added ride on this mechanic's show page.

      # Ex:
      # Mechanic: Kara Smith
      # Years of Experience: 11

      # Current rides they’re working on:
      #   The Frog Hopper
      #   Fahrenheit
      #   The Kiss Raise

      # Add a ride to workload:
      # Ride Id: |_pretend_this_is_a_textfield_|
      # Submit