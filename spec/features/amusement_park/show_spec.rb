require "rails_helper"

# Story 3 - Amusement Park Show page

# As a visitor,
# When I visit an amusement park’s show page,
# Then I see the name and price of admissions for that amusement park
# And I see the names of all mechanics that are working on that park's rides,
# And I see that the list of mechanics is unique


RSpec.describe 'When a user visits Parks show page', type: :feature do

  let!(:mechanic1){Mechanic.create(name: "Sam", years_experience: 12)}
  let!(:mechanic2){Mechanic.create(name: "Paulina", years_experience: 15)}

  let!(:park){AmusementPark.create(name: "Fun Zon", admission_cost: 50)}

  let!(:ride1){park.rides.create(name: "Thrasher", thrill_rating: 5, open: true)}
  let!(:ride2){park.rides.create(name: "Dumper", thrill_rating: 2, open: true)}

  let!(:ride3){park.rides.create(name: "The Big One", thrill_rating: 2, open: true)}

  let!(:ride_mechanic1){RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic1.id)}
  let!(:ride_mechanic2){RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic1.id)}
  let!(:ride_mechanic3){RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic2.id)}


  it "US03 - page shows price of admission and mechanics that are working on rides" do
    visit ("/amusement_parks/#{park.id}")
    expect(page).to have_content(park.name)
    expect(page).to have_content(mechanic1.name)
    save_and_open_page
  end
end

