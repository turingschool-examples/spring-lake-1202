require "rails_helper"

RSpec.describe "Mechanic Show Page" do
  it 'displays mechanics name, years of experience, and names of all rides they are working on' do
    amusementpark_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_experience: 10)
    mechanic_2 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    ride_1 = amusementpark_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    ride_2 = amusementpark_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
    ride_3 = amusementpark_1.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: false)
    mechanic_rides_1 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
    mechanic_rides_2 = MechanicRide.create!(mechanic: mechanic_2, ride: ride_2)
    mechanic_rides_3 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)

    visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_experience)
      expect(page).to_not have_content(mechanic_2.name)
      expect(page).to_not have_content(mechanic_2.years_experience)
      
    within("#mechanic-#{mechanic_1.id}") do
      
      expect(page).to have_content(mechanic_1.rides[0].name)
      expect(page).to have_content(mechanic_1.rides[1].name)
      expect(page).to_not have_content(mechanic_2.rides[0].name)
    end
  end

  it 'displays a form to add a ride to their workload' do
    amusementpark_1 = AmusementPark.create!(name: "Hershey Park", admission_cost: 50)
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_experience: 10)
    mechanic_2 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    ride_1 = amusementpark_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    ride_2 = amusementpark_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
    ride_3 = amusementpark_1.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: false)
    mechanic_rides_1 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
    mechanic_rides_2 = MechanicRide.create!(mechanic: mechanic_2, ride: ride_2)
    mechanic_rides_3 = MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)
    
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content("Add a ride to workload:")
    expect(find("form")).to have_content("Ride ID")
    expect(find("form")).to have_button("Submit")

    fill_in "Ride ID", with: "#{ride_2.id}"
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content("#{ride_2.name}")
  end
end
