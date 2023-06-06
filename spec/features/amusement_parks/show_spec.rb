require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  let(:amusement_park_1) { AmusementPark.create!(name: 'Hershey Park', admission_cost: 50) }
  let(:ride_1) { amusement_park_1.rides.create!(name: 'Lightning Racer', thrill_rating: 7, open: true) }
  let(:ride_2) { amusement_park_1.rides.create!(name: 'Storm Runner', thrill_rating: 9, open: true) }
  let(:ride_3) { amusement_park_1.rides.create!(name: 'Twister', thrill_rating: 6, open: false) }
  let(:mechanic_1) { Mechanic.create!(name: 'Sam Mills', years_experience: 10) }
  let(:mechanic_2) { Mechanic.create!(name: 'Kara Smith', years_experience: 11) }
  let!(:mechanic_ride_1) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_1) }
  let!(:mechanic_ride_2) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_2) }
  let!(:mechanic_ride_3) { MechanicRide.create!(mechanic: mechanic_2, ride: ride_3) }

  describe 'As a visitor, when I visit the amusement park show page' do
    it 'displays the name and price of admissions for that amusement park' do

      visit amusement_park_path(amusement_park_1)

      expect(page).to have_content("Amusement Park Name: #{amusement_park_1.name}")
      expect(page).to have_content("Admission Cost: $#{amusement_park_1.admission_cost}")
      save_and_open_page
    end
  end
end

# Story 3 - Amusement Park Show page

# As a visitor,
# When I visit an amusement park’s show page,
# Then I see the name and price of admissions for that amusement park
# And I see the names of all mechanics that are working on that park's rides,
# And I see that the list of mechanics is unique