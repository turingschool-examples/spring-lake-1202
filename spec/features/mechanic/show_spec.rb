require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  describe "Mechanic Attributes" do
    before :each do
      @park1 = AmusementPark.create!(name: "Two Flags", admission_cost: 25)

      @ride1 = @park1.rides.create!(name: "Vomit Machine", thrill_rating: 100, open: true)
      @ride2 = @park1.rides.create!(name: "Killer Coaster", thrill_rating: 75, open: true)
      @ride3 = @park1.rides.create!(name: "Puke Cruise", thrill_rating: 50, open: false)
      @ride4 = @park1.rides.create!(name: "Slow Ride", thrill_rating: 10, open: true)
      @ride5 = @park1.rides.create!(name: "Lazy River", thrill_rating: 1, open: true)
      @ride6 = @park1.rides.create!(name: "Hurl Twirler", thrill_rating: 99, open: false)
      
      @mechanic1 = Mechanic.create!(name: "Billy Bob", years_experience: 35)
      @mechanic2 = Mechanic.create!(name: "Silly Bob", years_experience: 1)

      @ride_mechanic1 = RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
      @ride_mechanic2 = RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
      @ride_mechanic3 = RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
      @ride_mechanic4 = RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
      @ride_mechanic5 = RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic2.id)
      @ride_mechanic6 = RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
    end

    it "shows the mechanic attributes" do
      # Story 1 - Mechanic Show Page

      # As a user,
      # When I visit a mechanic show page
      # I see their name, years of experience, and the names of all rides they are working on.
    
      visit "/mechanics/#{@mechanic1.id}"

      expect(page).to have_content("Mechanic: #{@mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic1.years_experience}")
      expect(@mechanic1.years_experience).to eq(35)
      expect(page).to_not have_content(@mechanic2.name)

      within "#rides" do
        expect(page).to have_content(@ride1.name)
        expect(page).to have_content(@ride2.name)
        expect(page).to have_content(@ride3.name)
        expect(page).to_not have_content(@ride4.name)
      end
    end

    it "Adds ride for mechanic maintenance" do
      # Story 2 - Add a Ride to a Mechanic

      # As a user,
      # When I go to a mechanic's show page
      # I see a form to add a ride to their workload
      # When I fill in that field with an id of an existing ride and click Submit
      # I’m taken back to that mechanic's show page
      # And I see the name of that newly added ride on this mechanic's show page.

      visit "/mechanics/#{@mechanic1.id}"

      within "#rides" do
        expect(page).to have_content(@ride1.name)
        expect(page).to have_content(@ride2.name)
        expect(page).to have_content(@ride3.name)
        expect(page).to_not have_content(@ride4.name)
      end

      within "#ride-form" do
        expect(page).to have_content("Add Ride for Mechanic")
        fill_in "Ride", with: "#{@ride4.id}"
        click_button "Submit"
        expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      end

      within "#rides" do
        expect(page).to have_content(@ride1.name)
        expect(page).to have_content(@ride2.name)
        expect(page).to have_content(@ride3.name)
        expect(page).to have_content(@ride4.name)
      end
    end
  end
end