require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  before (:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @huler = @six_flags.rides.create!(name: "The Huler", thrill_rating: 7, open: false)
    @jumper = @six_flags.rides.create!(name: "The Jumper", thrill_rating: 4, open: true)
    @skipper = @six_flags.rides.create!(name: "Great Skipper", thrill_rating: 7, open: false)


    @mechanic_1 = Mechanic.create!(name:"Kara Smith", years_experience: 11)

    RideMechanic.create!(ride: @huler, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @jumper, mechanic: @mechanic_1)
  end

  describe "As a user, when I visit a mechanic show page" do
    it "displays the mechanic's name, years of experience and all the rides they are working on" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_experience}")
      expect(page).to have_content("All Rides Currently Working On")
      expect(page).to have_content("Ride Name: #{@huler.name}")
      expect(page).to have_content("Ride Name: #{@jumper.name}")
    end

    it "displays a form to add a ride to their workload" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to_not have_content("Ride Name: #{@skipper.name}")
      expect(page).to have_field("Ride ID")

      fill_in(:ride_id, with: "#{@skipper.id}")
      click_button("Add Ride")

      expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
      expect(page).to have_content("Ride Name: #{@skipper.name}")
    end
  end
end