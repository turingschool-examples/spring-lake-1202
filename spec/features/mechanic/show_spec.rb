require "rails_helper"
# Story 1 - Mechanic Show Page

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on.


RSpec.describe 'When a user visits Mechanic show page', type: :feature do

  let!(:mechanic1){Mechanic.create(name: "Sam", years_experience: 12)}
  let!(:park){AmusementPark.create(name: "Fun Zon", admission_cost: 50)}
  let!(:ride1){park.rides.create(name: "Thrasher", thrill_rating: 5, open: true)}
  let!(:ride2){park.rides.create(name: "Dumper", thrill_rating: 2, open: false)}

  it "they see mechanic and their rides" do
    visit (mechanic1)
    expect(page).to have_content(mechanic1.name)
  end
end
