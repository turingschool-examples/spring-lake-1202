require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do

  let(:amusement_park_1) { AmusementPark.create!(name: 'Hershey Park', admission_cost: 50) }
  let(:ride_1) { amusement_park_1.rides.create!(name: 'Lightning Racer', thrill_rating: 7, open: true) }
  let(:ride_2) { amusement_park_1.rides.create!(name: 'Storm Runner', thrill_rating: 9, open: true) }
  let(:ride_3) { amusement_park_1.rides.create!(name: 'Twister', thrill_rating: 6, open: false) }
  let(:mechanic_1) { Mechanic.create!(name: 'Sam Mills', years_experience: 10) }
  let(:mechanic_2) { Mechanic.create!(name: 'Kara Smith', years_experience: 11) }
  let!(:mechanic_ride_1) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_1) }
  let!(:mechanic_ride_2) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_2) }
  let!(:mechanic_ride_3) { MechanicRide.create!(mechanic: mechanic_2, ride: ride_3) }
  
  describe 'As a user, when I visit the mechanic show page' do
    it 'displays their name, years of experience, and the names of all rides they are working on' do
      
      visit mechanic_path(mechanic_1)

      expect(page).to have_content("Name: #{mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_experience}")
      expect(page).to have_content("Ride Name: #{ride_1.name}")
      expect(page).to have_content("Ride Name: #{ride_2.name}")

      expect(page).to_not have_content("Name: #{mechanic_2.name}")
      expect(page).to_not have_content("Years of Experience: #{mechanic_2.years_experience}")
      expect(page).to_not have_content("Ride Name: #{ride_3.name}")
    end

    it "displays a form to add a ride to their workload" do
      # Mechanic 1

      visit mechanic_path(mechanic_1)

      expect(page).to_not have_content("#{ride_3.name}")

      expect(page).to have_content('Add a ride to workload:')
      expect(page).to have_field('Ride Id:')

      fill_in 'Ride Id:', with: "#{ride_3.id}"
      expect(page).to have_button('Submit')

      click_button 'Submit'

      expect(current_path).to eq(mechanic_path(mechanic_1))
      expect(page).to have_content("Ride Name: #{ride_3.name}")

      # Mechanic 2

      visit mechanic_path(mechanic_2)

      expect(page).to_not have_content("#{ride_1.name}")
      expect(page).to_not have_content("#{ride_2.name}")

      fill_in 'Ride Id:', with: "#{ride_1.id}"
      click_button 'Submit'
      fill_in 'Ride Id:', with: "#{ride_2.id}"
      click_button 'Submit'

      expect(current_path).to eq(mechanic_path(mechanic_2))
      expect(page).to have_content("#{ride_1.name}")
      expect(page).to have_content("#{ride_2.name}")
    end
  end
end