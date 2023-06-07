require "rails_helper"

RSpec.describe "the mechanic's show page" do
  let!(:amusement_park_1) { AmusementPark.create!(name: "Six Flags", admission_cost: 75) }

  let!(:ride_1) { amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true) }
  let!(:ride_2) { amusement_park_1.rides.create!(name: "The Scrambler", thrill_rating: 4, open: true) }
  let!(:ride_3) { amusement_park_1.rides.create!(name: "Ferris Wheel", thrill_rating: 7, open: false) }

  let!(:mechanic_1) { Mechanic.create!(name: "Sam Mills", years_experience: 10) }
  let!(:mechanic_2) { Mechanic.create!(name: "Kara Smith", years_experience: 11) }

  let!(:ride_mechanic_1) { RideMechanic.create!(ride: ride_1, mechanic: mechanic_1) }
  let!(:ride_mechanic_2) { RideMechanic.create!(ride: ride_2, mechanic: mechanic_1) }

  before(:each) do
    visit mechanic_path(mechanic_1)
  end

  it "displays their name and years of experience" do
    within("#page-title") do
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_experience}")

      expect(page).to_not have_content(mechanic_2.name)
    end
  end

  it "displays the names of all rides they're currently working on" do
    within("#current-rides") do
      expect(page).to have_content("Current rides they're working on:")
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)

      expect(page).to_not have_content(ride_3.name)
    end
  end
end