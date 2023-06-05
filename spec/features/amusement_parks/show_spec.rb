require 'rails_helper'

RSpec.describe "Amusement Park Show Page", type: :feature do
  before(:each) do
    test_data
  end

  it "displays the name and price of admissions for this park" do
    visit "/amusement_parks/#{@six_flags.id}"
    expect(page).to have_content("Name: #{@six_flags.name}")
    expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
  end

  xit "displays a unique list of mechanics working on this parks ride's " do

  end
end