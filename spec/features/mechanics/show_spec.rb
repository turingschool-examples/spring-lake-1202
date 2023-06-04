require "rails_helper"

RSpec.describe "mechanics show page", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "John Doe", years_of_experience: 6)

    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)

    @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @amusement_park_1.rides.create!(name: "The Frog Hopper", thrill_rating: 5, open: false)
    @ride_3 = @amusement_park_1.rides.create!(name: "Fahrenheit", thrill_rating: 4, open: false)
    @ride_4 = @amusement_park_1.rides.create!(name: "The Kiss Raise", thrill_rating: 1, open: false)

    @mechanic_1_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanic_1_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    @mechanic_1_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

    @mechanic_2_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)
  end

  describe "user sees mechanic's details" do
    describe "they visit mechanic show page" do
      it "displays mechanic info and rides working on" do
        visit mechanic_path(@mechanic_1)

        expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
        expect(page).to_not have_content("Mechanic: #{@mechanic_2.name}")
        expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_experience}")
        expect(page).to_not have_content("Years of Experience: #{@mechanic_2.years_of_experience}")

        within "#mechanic-rides" do
          expect(page).to have_content("Current rides they're working on")
          expect(page).to have_content(@ride_1.name)
          expect(page).to have_content(@ride_2.name)
          expect(page).to have_content(@ride_3.name)
          expect(page).to_not have_content(@ride_4.name)
        end
      end

      it "has a form to add rides to the mechanic's workload" do
        visit mechanic_path(@mechanic_2)

        within "#mechanic-rides" do
          expect(page).to have_content(@ride_4.name)
          expect(page).to_not have_content(@ride_1.name)
        end

        expect(page).to have_content("Add a ride to workload:")

        fill_in(:ride_id, with: @ride_1.id)
        click_button("Submit")

        expect(current_path).to eq(mechanic_path(@mechanic_2))

        @mechanic_2.reload

        within "#mechanic-rides" do
          expect(page).to have_content(@ride_1.name)
          expect(page).to have_content(@ride_4.name)
        end
      end
    end
  end
end