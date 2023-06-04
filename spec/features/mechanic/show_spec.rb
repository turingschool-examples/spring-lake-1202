require "rails_helper"

RSpec.describe "the mechanic show page" do
  # Story 1 - Mechanic Show Page
  it "I see their name, years of experience, and the names of all rides they are working on" do 
    ap1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    ap2 = AmusementPark.create!(name: "Disneyland", admission_cost: 100)
    ride1 = ap1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride2 = ap1.rides.create!(name: "Teacups", thrill_rating: 1, open: true)
    ride3 = ap1.rides.create!(name: "Race Cars", thrill_rating: 5, open: true)
    ride4 = ap2.rides.create!(name: "Splash Mountain", thrill_rating: 5, open: true)
    mechanic1 = ride1.mechanics.create!(name: "Michelle Obama", years_experience: 11)
    mechanic2 = ride2.mechanics.create!(name: "Simon G", years_experience: 3)
    mechanic3 = ride3.mechanics.create!(name: "Jolene Dog", years_experience: 4)
    mechanic4 = ride4.mechanics.create!(name: "Betty White", years_experience: 15)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content("Mechanic Name: #{mechanic1.name}")
    expect(page).to have_content("Mechanic Years of Experience: #{mechanic1.years_experience}")
    expect(page).to have_content(ride1.name)
    expect(page).to_not have_content(mechanic2.name)
    expect(page).to_not have_content(mechanic3.years_experience)
    expect(page).to_not have_content(ride2.name)
  end
end
