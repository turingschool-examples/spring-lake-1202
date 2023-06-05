require 'rails_helper'

RSpec.describe "Amusement Park Show Page", type: :feature do
  before(:each) do
    test_data
  end

  it "displays the name and price of admissions for this park" do
    visit "/amusement_parks/#{@six_flags.id}"
    expect(page).to have_content("Name: #{@six_flags.name}")
    expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
    expect(page).to_not have_content("Name: #{@disney.name}")
  end
  
  it "displays a unique list of mechanics working on this parks ride's " do
    visit "/amusement_parks/#{@six_flags.id}"
    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech2.name)
    expect(page).to_not have_content(@mech3.name)
    expect(page).to_not have_content(@mech4.name)
  end
end