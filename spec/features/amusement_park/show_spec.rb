require "rails_helper"

RSpec.describe "the amusement park show page" do
  # Story 3 - Amusement Park Show page
  it "I see the name and price of admissions for that amusement park and the unique names of all mechanics for that park's rides" do 
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

    visit "/amusement_parks/#{ap1.id}"

    expect(page).to have_content("Park Name: #{ap1.name}")
    expect(page).to have_content("Park Admission: $#{ap1.admission_cost}")
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic3.name)

    expect(page).to_not have_content(ap2.name)
    expect(page).to_not have_content(mechanic4.name)
  end
end
