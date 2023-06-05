require 'rails_helper'

RSpec.describe "Mechanic Show Page", type: :feature do
  before(:each) do
    test_data
  end

  it "can show the selected mechanic attributes" do
    visit "/mechanics/#{@mech1.id}"
    
    expect(page).to have_content("Name: #{@mech1.name}")
    expect(page).to have_content("Years of Experience: #{@mech1.years_experience}")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@mech2.name)
  end
  
  it "can add a ride to a mechanic by ride id" do
    visit "/mechanics/#{@mech4.id}"

    expect(page).to have_content("Add Ride by ID")

    fill_in(:ride_id, with: "#{@ride3.id}")
    click_button("Add")

    expect(current_path).to eq("/mechanics/#{@mech4.id}")
    expect(page).to have_content(@ride3.name)
  end
end