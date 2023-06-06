require "rails_helper"

RSpec.describe "Amusement Park show page", type: :feature do
  before (:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @huler = @six_flags.rides.create!(name: "The Huler", thrill_rating: 7, open: false)
    @jumper = @six_flags.rides.create!(name: "The Jumper", thrill_rating: 4, open: true)
    @skipper = @six_flags.rides.create!(name: "Great Skipper", thrill_rating: 7, open: false)

    @mechanic_1 = Mechanic.create!(name:"Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name:"Jon Doe", years_experience: 2)
    @mechanic_3 = Mechanic.create!(name:"Jane Washington", years_experience: 6)

    RideMechanic.create!(ride: @huler, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @jumper, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @huler, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @jumper, mechanic: @mechanic_2)
  end

  describe "As a visitor, when I visit the amusement park show page" do
    it "displays the name and price of addmission for that park" do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content("Name: #{@six_flags.name}")
      expect(page).to have_content("Admission Price: $75.00")
    end

    it "displays the names of all mechanics that are working on that park's rides" do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_2.name)
    end
  end
end