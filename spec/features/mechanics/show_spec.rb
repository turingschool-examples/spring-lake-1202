require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @jelly = @six_flags.mechanics.create!(name: "Jelly Parlor", years_experience: 12)
    @turbinator = @six_flags.rides.create!(name: 'The Turbinator', thrill_rating: 1, open: true)
    @juicer = @six_flags.rides.create!(name: 'The Juicer', thrill_rating: 9, open: false)

    RideMechanic.create!(ride_id: @juicer.id, mechanic_id: @jelly.id)
  end
  describe 'User Story 1' do 
    it 'displays attributes' do
      visit mechanic_path(@jelly)
      
      expect(page).to have_content(@jelly.name)
      expect(page).to have_content("Years of Experience: #{@jelly.years_experience}")
      within("#rides") do
        expect(page).to have_content("Rides Responsible:")
        expect(page).to have_content("#{@juicer.name}")
      end
    end
  end
  
  describe 'User Story 2' do 
    it 'adds a ride to a mechanic' do 
      visit mechanic_path(@jelly)

      within("#add-a-ride") do 
        expect(page).to have_content('Add Ride to Responsibilities:')
        expect(page).to have_button('Add Ride')

        fill_in(:ride_id, with: @turbinator.id)
        click_button('Add Ride')
      end

      expect(current_path).to eq(mechanic_path(@jelly))
      
      within("#rides") do 
        expect(page).to have_content("#{@turbinator.name}")
      end
    end
  end
end