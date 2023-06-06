require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  before(:each) do 
    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 50)
    @mechanic_1 = Mechanic.create!(name: "Jimmy", years_experience: 20)
    @ride_1 = @amusement_park_1.rides.create!(name: "Texas Giant", thrill_rating: 1, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: "Mr. Freeze", thrill_rating: 10, open: false)
    @ride_3 = @amusement_park_1.rides.create!(name: "Chipmunk", thrill_rating: 0, open: true)
    @mechanics_rides_1 = MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    @mechanics_rides_2 = MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
  end
  describe "When a user visits the mechanic show page" do
    it "displays mechanic's name, years of experience, and names of all the rides they are working on" do
      visit mechanic_path(@mechanic_1)

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end
  end

  it "displays a form to add a ride to mechanics workload" do
    visit mechanic_path(@mechanic_1)

    expect(page).to have_field("Name")
    expect(page).to have_field("Thrill rating")
    expect(page).to have_field("Open")
    expect(page).to have_button("Submit")
  end

  it "they can fill in form with existing ride, hit submit, and redirected back to mechanic show page with name of new added ride" do
    visit mechanic_path(@mechanic_1)

    fill_in("Name", with: "#{@ride_3.name}")
    fill_in("Thrill rating", with: "#{@ride_3.thrill_rating}")
  

    click_button("Submit")
    save_and_open_page

    expect(current_path).to eq(mechanic_path(@mechanic_1))
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@ride_3.name)
  end
end