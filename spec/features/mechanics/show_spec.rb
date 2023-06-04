require "rails_helper"

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "John Doe", years_experience: 4)

    @park_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    @park_2 = AmusementPark.create!(name: "Cedar Point", admission_cost: 75)

    @ride_1 = Ride.create!(name: "Lightning Racer", thrill_rating: 7, open: true, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: "Storm Runner", thrill_rating: 9, open: true, amusement_park_id: @park_1.id)
    @ride_3 = Ride.create!(name: "The Great Bear", thrill_rating: 5, open: false, amusement_park_id: @park_2.id)
    @ride_4 = Ride.create!(name: "The Kiss Raise", thrill_rating: 2, open: false, amusement_park_id: @park_1.id)
    @ride_5 = Ride.create!(name: "Thunderbird", thrill_rating: 8, open: true, amusement_park_id: @park_2.id)

    @mechanic_ride_1 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanic_ride_2 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    @mechanic_ride_3 = MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
    @mechanic_ride_4 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)
    @mechanic_ride_5 = MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_5.id)
  end

  describe "As a user" do
    describe "When I visit a mechanics show page" do
      it "I see their name, years of experience, and names of all rides they’re working on" do
        visit "/mechanics/#{@mechanic_1.id}"

        expect(page).to have_content(@mechanic_1.name)
        expect(page).to have_content(@mechanic_1.years_experience)
        expect(page).to have_content(@ride_1.name)
        expect(page).to have_content(@ride_2.name)
        expect(page).to have_content(@ride_3.name)
      end

      it "shows a form to add a ride to their workload" do
        visit "/mechanics/#{@mechanic_1.id}"

        expect(page).to have_content("Add a ride to workload:")
        expect(page).to have_field("Ride ID")

        fill_in "Ride ID", with: @ride_4.id
        click_button "Submit"

        expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
      end
    end
  end
end