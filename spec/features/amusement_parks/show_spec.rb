require "rails_helper"

RSpec.describe "Amusement Park Show Page" do
  let!(:park1) { AmusementPark.create!(name: "Kings Dominion", admission_cost: 50)}
  let!(:park2) { AmusementPark.create!(name: "Hershey Park", admission_cost: 99)}

  let!(:ride1) { park1.rides.create!(name: "Anaconda", thrill_rating: 8, open: false)}
  let!(:ride2) { park1.rides.create!(name: "Dominator", thrill_rating: 9, open: false)}
  let!(:ride3) { park1.rides.create!(name: "Racer 75", thrill_rating: 4, open: false)}
  let!(:ride4) { park1.rides.create!(name: "Grizzly", thrill_rating: 3, open: false)}

  let!(:ride5) { park2.rides.create!(name: "Skyrush", thrill_rating: 6, open: false)}
  let!(:ride6) { park2.rides.create!(name: "Storm Runner", thrill_rating: 7, open: false)}
  let!(:ride7) { park2.rides.create!(name: "Comet", thrill_rating: 4, open: false)}
  let!(:ride8) { park2.rides.create!(name: "Great Bear", thrill_rating: 3, open: false)}

  let!(:mechanic1) { Mechanic.create!(name: "James Dole", years_experience: 14) }
  let!(:mechanic2) { Mechanic.create!(name: "Cameron Hayes", years_experience: 3) }

  let!(:mechanic3) { Mechanic.create!(name: "Billy Worthington", years_experience: 9) }


  let!(:mechanic_1_ride1) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride1.id)}
  let!(:mechanic_1_ride2) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride2.id)}
  let!(:mechanic_1_ride3) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride3.id)}

  let!(:mechanic_2_ride4) { MechanicRide.create!(mechanic_id: mechanic2.id, ride_id: ride4.id)}

  let!(:mechanic_3_ride5) { MechanicRide.create!(mechanic_id: mechanic3.id, ride_id: ride5.id)}
  let!(:mechanic_3_ride6) { MechanicRide.create!(mechanic_id: mechanic3.id, ride_id: ride6.id)}
  let!(:mechanic_3_ride7) { MechanicRide.create!(mechanic_id: mechanic3.id, ride_id: ride7.id)}

  describe "amusement park's show page" do
    it "displays name and prive of admission for that amusement park" do
      visit "/amusement_parks/#{park1.id}"

      expect(page).to have_content(park1.name)
      expect(page).to have_content(park1.admission_cost)

      expect(page).to_not have_content(park2.name)
      expect(page).to_not have_content(park2.admission_cost)
    end

    it "displays the names of all mechanics that are working on that park's rides and list is unique" do
      visit "/amusement_parks/#{park1.id}"

      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic2.name)

      expect(page).to_not have_content(mechanic3.name)

      visit "/amusement_parks/#{park2.id}"

      expect(page).to have_content(mechanic3.name)

      expect(page).to_not have_content(mechanic1.name)
      expect(page).to_not have_content(mechanic2.name)
    end

  end
end