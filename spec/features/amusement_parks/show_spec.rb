require "rails_helper"

RSpec.describe "Amusement Park Show Page" do
  it 'display name and price of admission for that park' do
    amusementpark_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    amusementpark_2 = AmusementPark.create!(name: "Cedar Point", admission_cost: 60)
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_experience: 10)
    mechanic_2 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    ride_1 = amusementpark_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    ride_2 = amusementpark_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
    ride_3 = amusementpark_1.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: false)
    mechanic_rides_1 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
    mechanic_rides_2 = MechanicRide.create!(mechanic: mechanic_2, ride: ride_2)
    mechanic_rides_3 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)
    
    visit "/amusement_parks/#{amusementpark_1.id}"

    expect(page).to have_content("#{amusementpark_1.name}")
    expect(page).to have_content("#{amusementpark_1.admission_cost}")
    expect(page).to_not have_content("#{amusementpark_2.name}")
    expect(page).to_not have_content("#{amusementpark_2.admission_cost}")
  end

  it 'displays unique names of all mechanics working on that park rides' do
    amusementpark_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    amusementpark_2 = AmusementPark.create!(name: "Cedar Point", admission_cost: 60)
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_experience: 10)
    mechanic_2 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    ride_1 = amusementpark_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    ride_2 = amusementpark_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
    ride_3 = amusementpark_1.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: false)
    mechanic_rides_1 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
    mechanic_rides_2 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_2)
    mechanic_rides_3 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)

    visit "/amusement_parks/#{amusementpark_1.id}"

    expect(page).to have_content("#{mechanic_1.name}")
    expect(page).to_not have_content("#{mechanic_2.name}")
  end
end
