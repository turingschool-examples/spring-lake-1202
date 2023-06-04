require "rails_helper"

RSpec.describe "Mechanic Show Page" do 
  before(:each) do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic_1 = Mechanic.create!(name: "Amy S", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Vivian V", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Penny V", years_experience: 8)

    @mechanic_1.rides << [@hurler, @scrambler]

  end

  it "US1 I see their years of experience and names of all rides they are working" do
    visit "/mechanics/#{@mechanic_1.id}"
save_and_open_page

    within("h1") do
      expect(page).to have_content("Mechanic Show Page")
    end

    within("#mechanic-info") do
      expect(page).to have_content("Name: #{@mechanic_1.name}")
      expect(page).to have_content("Years Experience: #{@mechanic_1.years_experience}")
      expect(page).to_not have_content(@mechanic_2.name)
    end

    within("#ride-info") do
      expect(page).to have_content("Rides Worked On")
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@scrambler.name)
      expect(page).to_not have_content(@ferris.name)
    end
  end
end