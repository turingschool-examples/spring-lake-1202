require "rails_helper"

RSpec.describe "Amusement Park Show Page" do 
  before(:each) do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @tea_cup = @six_flags.rides.create!(name: 'Tea Cup Ride', thrill_rating: 3, open: true)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic_1 = Mechanic.create!(name: "Amy S", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Vivian V", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Penny V", years_experience: 8)

    @mechanic_1.rides << [@hurler, @scrambler]
    @mechanic_2.rides << [@hurler, @tea_cup]
  
  end

  describe "US3 Amusement Park Show page" do
    it "I see the name and price of admissions for that amusement park And I see the names of all mechanics that are working on that park's rides,
    And I see that the list of mechanics is unique" do
      visit "/amusement_parks/#{@six_flags.id}"
save_and_open_page

      within("#park-info") do
        expect(page).to have_content("Name: #{@six_flags.name}")
        expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
        expect(page).to_not have_content(@universal.name)
        end
      end
    end
  end