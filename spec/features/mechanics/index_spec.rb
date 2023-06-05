require "rails_helper"

RSpec.describe "index page" do
  before(:each) do
    @park_1 = AmusementPark.create!(name: "Fun land", admission_cost: 50)
    @ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    @mechanic_1 = @ride_1.mechanics.create(name: "Bill", years_experience: 12)
  end
  it "displays mechanics details" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content("Name: Bill")
    expect(page).to have_content("Experince: 12 years")
    expect(page).to have_content("Rides working on: Twister")


  end
end