require "rails_helper"

RSpec.describe "mechanics show page", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)

    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)

    @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @amusement_park_1.rides.create!(name: "Batman", thrill_rating: 6, open: false)

    @mechanic_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanic_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
  end

  describe "user sees mechanix details" do
    describe "they visit mechanic show page" do
      it "displays mechanic info and rides working on" do
        visit mechanic_path(@mechanic_1)

        expect(page).to have_content("Mechanic Name: #{@mechanic_1.name}")
        expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_experience}")
        expect(page).to have_content(@ride_1.name)
        expect(page).to have_content(@ride_2.name)
      end
    end
  end
end