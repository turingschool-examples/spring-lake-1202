require "rails_helper"

RSpec.describe "index page" do
  before(:each) do
    @park_1 = AmusementPark.create!(name: "Fun land", admission_cost: 50)
    @ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create!(name: "Snake", thrill_rating: 7, open: true)
    @mechanic_1 = Mechanic.create(name: "Bill", years_experience: 12, ride_id: @ride_1.id)
    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    
  end
  it "displays mechanics details" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content("Name: Bill")
    expect(page).to have_content("Experince: 12 years")
    expect(page).to have_content("Twister")
    expect(page).to have_content("Snake")
  end

  it "displays form to add ride to mechanic" do
    visit "/mechanics/#{@mechanic_1.id}"
    fill_in "Name", with: "Log Ride"
    fill_in "thrill_rating", with: 6
    fill_in "open", with: true
    click_button("ADD Ride")
    expect(page).to have_content("Log Ride")
  end
end