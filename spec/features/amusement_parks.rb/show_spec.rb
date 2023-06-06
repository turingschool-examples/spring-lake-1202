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

  let!(:ride_mech_1) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: log.id) }
  let!(:ride_mech_2) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: mant.id) }
  let!(:ride_mech_3) { RideMechanic.create!(mechanic_id: mech_2.id, ride_id: holy.id) }
  let!(:ride_mech_4) { RideMechanic.create!(mechanic_id: mech_2.id, ride_id: mant.id) }
  let!(:ride_mech_5) { RideMechanic.create!(mechanic_id: mech_3.id, ride_id: me.id) }

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
end
