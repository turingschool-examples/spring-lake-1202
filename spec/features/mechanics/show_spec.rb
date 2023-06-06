require "rails_helper"

RSpec.describe "the mechanics show page" do 
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @pukie = @six_flags.rides.create!(name: 'The Pukie', thrill_rating: 9, open: true)

    @bob = Mechanic.create!(name: "Bob", years_experience: 10)

    @bob_hurler = MechanicsRide.create!(ride: @hurler, mechanic: @bob)
    @bob_pukie = MechanicsRide.create!(ride: @pukie, mechanic: @bob)
  end

  describe "as a user" do 
    it "renders the mechanic's name, years of experience, and the names of rides they are working on" do 
      visit "/mechanics/#{@bob.id}"

      within(".mechanic_header") do 
        expect(page).to have_content("Mechanic: #{@bob.name}")
        expect(page).to have_content("Years of experience: #{@bob.years_experience}")
        expect(page).to have_content("#{@hurler.name}")
        expect(page).to have_content("#{@pukie.name}")
      end
    end
  end
end