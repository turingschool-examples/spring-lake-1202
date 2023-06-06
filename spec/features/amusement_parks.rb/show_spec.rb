require 'rails_helper'

RSpec.describe 'amusement parks show page' do
  let!(:mech_1) { Mechanic.create!(name: "Buddy", years_experience: 18) }
  let!(:mech_2) { Mechanic.create!(name: "Ralph", years_experience: 26) }
  let!(:mech_3) { Mechanic.create!(name: "Xtina", years_experience: 12) }
  
  let!(:cedar) { AmusementPark.create!(name: "Cedar Point", admission_cost: 50) }
  let!(:elitch) { AmusementPark.create!(name: "Elitch Gardens", admission_cost: 55) }

  let!(:log) { cedar.rides.create!(name: "Log Jammin'", thrill_rating: 6, open: true) }
  let!(:mant) { cedar.rides.create!(name: "The Mantis", thrill_rating: 9, open: true) }
  let!(:holy) { cedar.rides.create!(name: "Holy Roller", thrill_rating: 10, open: false) }
  let!(:me) { elitch.rides.create!(name: "Mind Eraser", thrill_rating: 9, open: true) }

  let!(:ride_mech_1) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: log.id) } #18
  let!(:ride_mech_2) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: mant.id) } #18
  let!(:ride_mech_3) { RideMechanic.create!(mechanic_id: mech_2.id, ride_id: holy.id) } #26
  let!(:ride_mech_4) { RideMechanic.create!(mechanic_id: mech_2.id, ride_id: mant.id) } #22 avg
  let!(:ride_mech_5) { RideMechanic.create!(mechanic_id: mech_3.id, ride_id: me.id) } #12

  describe 'displays the amusement parks attributes and mechanics working on rides there' do
    it 'should display the amusement parks name and admission fee' do
      visit amusement_park_path(cedar)
      
      expect(page).to have_content(cedar.name)
      expect(page).to have_content(cedar.admission_cost)
    end

    it 'should display the distinct names of the mechanics working on the rides' do
      visit amusement_park_path(cedar)
      
      expect(page).to have_content(mech_1.name)
      expect(page).to have_content(mech_2.name)
      expect(page).to_not have_content(mech_3.name)
      
      visit amusement_park_path(elitch)
      
      expect(page).to_not have_content(mech_1.name)
      expect(page).to_not have_content(mech_2.name)
      expect(page).to have_content(mech_3.name)
    end
  end

  describe 'displays an ordered list of rides with mechanics and their average years worked' do
    it 'should display an ordered list of rides by mechanics average expereince' do
      visit amusement_park_path(cedar)
      save_and_open_page
      expect(holy.name).to appear_before(mant.name)
      expect(mant.name).to appear_before(log.name)
      expect(page).to have_content(18)
      expect(page).to have_content(22)
      expect(page).to have_content(26)
    end
  end
end
# As a visitor,
# When I visit an amusement park's show page,
# Then I see a list of all of the park's rides,
# And next to the ride name I see the average experience of the mechanics working on the ride,
# And I see the list of rides is ordered by the average experience of mechanics working on the ride.
# (Note: you should only perform 1 database query to retrieve the list of rides with average mechanic experience)