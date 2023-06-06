require "rails_helper"
# Story 1 - Mechanic Show Page
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on.


RSpec.describe 'When a user visits Mechanic show page', type: :feature do

  let!(:mechanic1){Mechanic.create(name: "Sam", years_experience: 12)}
  let!(:park){AmusementPark.create(name: "Fun Zon", admission_cost: 50)}

  let!(:ride1){park.rides.create(name: "Thrasher", thrill_rating: 5, open: true)}
  let!(:ride2){park.rides.create(name: "Dumper", thrill_rating: 2, open: true)}

  let!(:ride_mechanic1){RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic1.id)}
  let!(:ride_mechanic2){RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic1.id)}

  it "US01 - they see mechanic and their rides along with years of experience" do
    visit ("/mechanics/#{mechanic1.id}")
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    save_and_open_page
  end
end
