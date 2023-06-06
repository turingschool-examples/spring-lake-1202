
require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @kingdom_come = AmusementPark.create!(name: 'The Kingdom', admission_cost: 90)

    @jelly = @six_flags.mechanics.create!(name: "Jelly Parlor", years_experience: 12)
    @josey = @six_flags.mechanics.create!(name: "Josey Jester", years_experience: 30)
    @janet = @six_flags.mechanics.create!(name: "Janet Joplin", years_experience: 1)
    @jorge = @kingdom_come.mechanics.create!(name: "Jorge Manet", years_experience: 3)

    @drop = @six_flags.rides.create!(name: 'The Drop', thrill_rating: 5, open: false)
    @flight = @six_flags.rides.create!(name: 'In Flight', thrill_rating: 5, open: true)
    @tea_cups = @six_flags.rides.create!(name: 'Tea Cups', thrill_rating: 5, open: false)
    @half_pipe = @six_flags.rides.create!(name: 'Half Pipe', thrill_rating: 2, open: false)
    @turbinator = @kingdom_come.rides.create!(name: 'The Turbinator', thrill_rating: 1, open: true)
    
    RideMechanic.create!(ride_id: @drop.id, mechanic_id: @jelly.id)
    RideMechanic.create!(ride_id: @flight.id, mechanic_id: @jelly.id)
    RideMechanic.create!(ride_id: @tea_cups.id, mechanic_id: @janet.id)
    RideMechanic.create!(ride_id: @half_pipe.id, mechanic_id: @josey.id)
    RideMechanic.create!(ride_id: @turbinator.id, mechanic_id: @jorge.id)
  end
  
  describe 'User Story 3' do 
    it 'displays park name & admissions cost' do 
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content("#{@six_flags.name}")
      expect(page).to have_content("Price of Admissions: #{@six_flags.admission_cost}")
    end

    it 'displays list of all mechanics' do 
      visit "/amusement_parks/#{@six_flags.id}"

      within("#mechanics") do 
        expect(page).to have_content("Mechanics:")
        expect(page).to have_content(@josey.name)
        expect(page).to have_content(@jelly.name)
        expect(page).to have_content(@janet.name)
        
        expect(page).to_not have_content(@jorge.name)
      end
    end

    it 'list of all mechanics is unique' do 
      visit "/amusement_parks/#{@six_flags.id}"

      within("#mechanics") do 
        expect(page).to_not have_content(@josey.name).twice
        expect(page).to_not have_content(@jelly.name).twice
        expect(page).to_not have_content(@janet.name).twice
      end
    end
  end
end
  # Story 3 - Amusement Park Show page
  
  # As a visitor,
  # When I visit an amusement park’s show page,
  # Then I see the name and price of admissions for that amusement park
  # And I see the names of all mechanics that are working on that park's rides,
  # And I see that the list of mechanics is unique