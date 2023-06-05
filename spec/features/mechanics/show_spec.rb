require "rails_helper"

RSpec.describe "Mechanic Show Page" do

  let!(mechanic1) { Mechanic.create!(name: "James Dole", years_experience: 14) }
  let!(mechanic2) { Mechanic.create!(name: "Cameron Hayes", years_experience: 4) }

  let!(park1) { AmusementPark.create!(name: "Kings Dominion", admission_cost: 50)}

  let!(ride1) { park1.rides.create!(name: "Anaconda", thrill_rating: 8, open: fales)}
  let!(ride2) { park1.rides.create!(name: "Dominator", thrill_rating: 9, open: fales)}
  let!(ride3) { park1.rides.create!(name: "Racer 75", thrill_rating: 4, open: fales)}
  let!(ride4) { park1.rides.create!(name: "Grizzly", thrill_rating: 3, open: fales)}

  let!(mechanic_1_ride1) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride1.id)}
  let!(mechanic_1_ride2) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride2.id)}
  let!(mechanic_1_ride3) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride3.id)}

  let!(mechanic_2_ride4) { MechanicRide.create!(mechanic_id: mechanic2.id, ride_id: ride4.id)}

  describe "mechanics/:id" do
    it "displays mechanic name, years of experience and name of all the rides they are working on" do
      visit "/mechanics/#{mechanic1.id}"

      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_experience)

      expect(page).to have_content(mechanic2.name)
      expect(page).to have_content(mechanic2.years_experience)

      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to have_content(ride3.name)

      expect(page).to_not have_content(ride4.name)


    end
  end
end