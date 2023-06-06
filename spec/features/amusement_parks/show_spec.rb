
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
      visit amusement_park_path(@six_flags)

      expect(page).to have_content("#{@six_flags.name}")
      expect(page).to have_content("Price of Admissions: #{@six_flags.admission_cost}")
    end

    it 'displays list of all mechanics' do 
      visit amusement_park_path(@six_flags)

      within("#mechanics") do 
        expect(page).to have_content("Mechanics:")
        expect(page).to have_content(@josey.name)
        expect(page).to have_content(@jelly.name)
        expect(page).to have_content(@janet.name)
        
        expect(page).to_not have_content(@jorge.name)
      end
    end

    it 'list of all mechanics is unique' do 
      visit amusement_park_path(@six_flags)

      within("#mechanics") do 
        expect(page).to_not have_content(@josey.name).twice
        expect(page).to_not have_content(@jelly.name).twice
        expect(page).to_not have_content(@janet.name).twice
      end
    end
  end

  describe 'Extension' do 
    it 'lists all park rides' do 
      visit amusement_park_path(@six_flags)

      within("#rides") do 
        expect(page).to have_content("Rides:")
        expect(page).to have_content("#{@drop.name}")
        expect(page).to have_content("#{@tea_cups.name}")
        expect(page).to have_content("#{@flight.name}")
        expect(page).to have_content("#{@half_pipe.name}")
      end
    end
  end
end

# Extensions - Amusement Park's Rides

# As a visitor,
# When I visit an amusement park's show page,
# Then I see a list of all of the park's rides,
# And next to the ride name I see the average experience of the mechanics working on the ride,
# And I see the list of rides is ordered by the average experience of mechanics working on the ride.
# (Note: you should only perform 1 database query to retrieve the list of rides with average mechanic experience)