require "rails_helper"

RSpec.describe "amusement park show page", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "John Doe", years_of_experience: 6)
    @mechanic_3 = Mechanic.create!(name: "Jane Doe", years_of_experience: 12)
    @mechanic_4 = Mechanic.create!(name: "Michael Mechanix", years_of_experience: 1)

    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @amusement_park_2 = AmusementPark.create!(name: "Knotts Berry Farm", admission_cost: 50)

    @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @amusement_park_1.rides.create!(name: "The Frog Hopper", thrill_rating: 5, open: false)
    @ride_3 = @amusement_park_1.rides.create!(name: "Fahrenheit", thrill_rating: 4, open: false)
    @ride_4 = @amusement_park_1.rides.create!(name: "The Kiss Raise", thrill_rating: 1, open: false)

    @ride_5 = @amusement_park_2.rides.create!(name: "The Ride", thrill_rating: 7, open: false)
    @ride_6 = @amusement_park_2.rides.create!(name: "The Other Ride", thrill_rating: 5, open: false)
    @ride_7 = @amusement_park_2.rides.create!(name: "The Other Other Ride", thrill_rating: 4, open: false)
    @ride_8 = @amusement_park_2.rides.create!(name: "The Otherest Ride", thrill_rating: 1, open: false)

    @mechanic_1_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanic_1_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    @mechanic_1_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

    @mechanic_2_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)

    @mechanic_3_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_5.id)
    @mechanic_3_ride_6 = MechanicRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ride_6.id)
    @mechanic_4_ride_7 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_7.id)
    @mechanic_4_ride_8 = MechanicRide.create!(mechanic_id: @mechanic_4.id, ride_id: @ride_8.id)
  end

  describe "user sees amusement parks's details" do
    describe "they visit amusement park's show page" do
      context "amusement park 1" do
        it "displays name and price of admission" do
          visit amusement_park_path(@amusement_park_1)

          expect(page).to have_content("Amusement Park: #{@amusement_park_1.name}")
          expect(page).to have_content("Price of Admission: $#{@amusement_park_1.admission_cost}.00")
        end

        it "displays unique list of names of all mechanics working on that park's rides" do
          visit amusement_park_path(@amusement_park_1)

          within "#amusement-park-mechanics" do
            expect(page).to have_content("Mechanics working at Park:")
            expect(page).to have_content(@mechanic_1.name)
            expect(page).to have_content(@mechanic_2.name)
            expect(page).to_not have_content(@mechanic_3.name)
            expect(page).to_not have_content(@mechanic_4.name)
          end
        end
      end

      context "amusement park 2" do
        it "displays name and price of admission" do
          visit amusement_park_path(@amusement_park_2)

          expect(page).to have_content("Amusement Park: #{@amusement_park_2.name}")
          expect(page).to have_content("Price of Admission: $#{@amusement_park_2.admission_cost}.00")
        end

        it "displays unique list of names of all mechanics working on that park's rides" do
          visit amusement_park_path(@amusement_park_2)

          within "#amusement-park-mechanics" do
            expect(page).to have_content("Mechanics working at Park:")
            expect(page).to have_content(@mechanic_3.name)
            expect(page).to have_content(@mechanic_4.name)
            expect(page).to_not have_content(@mechanic_1.name)
            expect(page).to_not have_content(@mechanic_2.name)
          end
        end
      end
    end
  end
end