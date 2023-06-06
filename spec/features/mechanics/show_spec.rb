require 'rails_helper'

RSpec.describe 'mechanics show page' do
  let!(:mech_1) { Mechanic.create!(name: "Buddy", years_experience: 18) }
  let!(:mech_2) { Mechanic.create!(name: "Ralph", years_experience: 26) }
  
  let!(:cedar) { AmusementPark.create!(name: "Cedar Point", admission_cost: 50) }

  let!(:log) { cedar.rides.create!(name: "Log Jammin'", thrill_rating: 6, open: true) }
  let!(:mant) { cedar.rides.create!(name: "The Mantis", thrill_rating: 9, open: true) }

  let!(:ride_mech_1) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: log.id) }
  let!(:ride_mech_2) { RideMechanic.create!(mechanic_id: mech_1.id, ride_id: mant.id) }

  describe 'displays the mechanics attributes and rides they are working on' do
    it 'should display the mechanics name and years of experience' do
      visit mechanic_path(mech_1)
      
      expect(page).to have_content(mech_1.name)
      expect(page).to have_content(mech_1.years_experience)
    end

    it 'should display the rides this mechanic is working on' do
      visit mechanic_path(mech_1)
      
      expect(page).to have_content(log.name)
      expect(page).to have_content(mant.name)
    end
  end
end
