require 'rails_helper'

RSpec.describe "Mechanic Show Page", type: :feature do
  before(:each) do
    test_data
  end

  it "Can show the selected mechanic attributes" do
    visit "/mechanics/#{@mech1.id}"

    expect(page).to have_content("Name: #{@mech1.name}")
    expect(page).to have_content("Years of Experience: #{@mech1.years_experience}")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@mech2.name)
  end
end