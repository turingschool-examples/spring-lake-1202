require "rails_helper"

RSpec.describe "Amusement Parks Show Page" do
  before(:each) do
    @amusement_park_1 = AmusementPark.create!(name: "Fantasy Land", admission_cost: 20)
    @amusement_park_2 = AmusementPark.create!(name: "Disney World", admission_cost: 400)

    @mechanic_1 = Mechanic.create!(name: "Tom", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Billy", years_experience: 1)
    @mechanic_3 = Mechanic.create!(name: "Mike", years_experience: 14)
    @mechanic_4 = Mechanic.create!(name: "Bob", years_experience: 3)
    @mechanic_5 = Mechanic.create!(name: "Kelly", years_experience: 7)

    @ride_1 = @amusement_park_1.rides.create!(name: "Big Rollercoaster", thrill_rating: 8, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: "Lazy Carousel", thrill_rating: 1, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: "Tilt-A-Whirl", thrill_rating: 7, open: false)
    @ride_4 = @amusement_park_1.rides.create!(name: "Ferris Wheel", thrill_rating: 3, open: true)
    @ride_5 = @amusement_park_2.rides.create!(name: "Small World", thrill_rating: 4, open: true)
    @ride_6 = @amusement_park_2.rides.create!(name: "Pirate Cavern", thrill_rating: 5, open: false)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_4, ride: @ride_5)
    MechanicRide.create!(mechanic: @mechanic_5, ride: @ride_6)
    MechanicRide.create!(mechanic: @mechanic_5, ride: @ride_6)
  end

  describe "Amusement Parks Display" do
    it "displays the name and price of admission for that amusement park" do
      visit "/amusement_parks/#{@amusement_park_1.id}"

      expect(page).to have_content(@amusement_park_1.name)
      expect(page).to_not have_content(@amusement_park_2.name)
      expect(page).to have_content("Admission Price: #{@amusement_park_1.admission_cost}")

      visit "/amusement_parks/#{@amusement_park_2.id}"

      expect(page).to have_content(@amusement_park_2.name)
      expect(page).to_not have_content(@amusement_park_1.name)
      expect(page).to have_content("Admission Price: #{@amusement_park_2.admission_cost}")
    end

    it "displays the names of all UNIQUE mechanics that are working on that park's rides" do
      visit "/amusement_parks/#{@amusement_park_1.id}"
      
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to_not have_content(@mechanic_4.name)
      expect(page).to_not have_content(@mechanic_5.name)

      visit "/amusement_parks/#{@amusement_park_2.id}"
      
      expect(page).to_not have_content(@mechanic_1.name)
      expect(page).to_not have_content(@mechanic_2.name)
      expect(page).to_not have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_4.name)
      expect(page).to have_content(@mechanic_5.name)
    end
  end
end