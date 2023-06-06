require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do

  let!(:amusement_park_1) { AmusementPark.create!(name: 'Hershey Park', admission_cost: 50) }
  let!(:amusement_park_2) { AmusementPark.create!(name: 'Cedar Point', admission_cost: 75) }
  let!(:ride_1) { amusement_park_1.rides.create!(name: 'Lightning Racer', thrill_rating: 7, open: true) }
  let!(:ride_2) { amusement_park_1.rides.create!(name: 'Storm Runner', thrill_rating: 9, open: true) }
  let!(:ride_3) { amusement_park_1.rides.create!(name: 'Twister', thrill_rating: 6, open: false) }
  let!(:ride_4) { amusement_park_2.rides.create!(name: 'Top Thrill Dragster', thrill_rating: 10, open: true) }
  let!(:mechanic_1) { Mechanic.create!(name: 'Sam Mills', years_experience: 10) }
  let!(:mechanic_2) { Mechanic.create!(name: 'Kara Smith', years_experience: 11) }
  let!(:mechanic_3) { Mechanic.create!(name: 'Freddy Mercury', years_experience: 12) }
  let!(:mechanic_4) { Mechanic.create!(name: 'John Lennon', years_experience: 2) }
  let!(:mechanic_ride_1) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_1) }
  let!(:mechanic_ride_2) { MechanicRide.create!(mechanic: mechanic_1, ride: ride_2) }
  let!(:mechanic_ride_3) { MechanicRide.create!(mechanic: mechanic_2, ride: ride_1) }
  let!(:mechanic_ride_4) { MechanicRide.create!(mechanic: mechanic_2, ride: ride_3) }
  let!(:mechanic_ride_5) { MechanicRide.create!(mechanic: mechanic_3, ride: ride_3) }
  let!(:mechanic_ride_6) { MechanicRide.create!(mechanic: mechanic_4, ride: ride_4) }

  before(:each) do

    visit amusement_park_path(amusement_park_1)

  end

  describe 'As a visitor, when I visit the Amusement Park Show Page' do
    it 'displays the name and price of admissions for that amusement park' do

      expect(page).to have_content("Name: #{amusement_park_1.name}")
      expect(page).to have_content("Admission Cost: $#{amusement_park_1.admission_cost}")

      expect(page).to_not have_content("Name: #{amusement_park_2.name}")
      expect(page).to_not have_content("Admission Cost: $#{amusement_park_2.admission_cost}")
    end

    it 'displays the names of all mechanics that are working on that park’s rides' do
        
      expect(page).to have_content("Mechanic: #{mechanic_1.name}")
      expect(page).to have_content("Rides they’re working on: #{ride_1.name}, #{ride_2.name}")

      expect(page).to have_content("Mechanic: #{mechanic_2.name}")
      expect(page).to have_content("Rides they’re working on: #{ride_1.name}, #{ride_3.name}")

      expect(page).to have_content("Mechanic: #{mechanic_3.name}")
      expect(page).to have_content("Rides they’re working on: #{ride_3.name}")

      expect(page).to_not have_content("Mechanic: #{mechanic_4.name}")
      expect(page).to_not have_content("Rides they’re working on: #{ride_4.name}")
    end
  end
end