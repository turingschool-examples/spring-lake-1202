require "rails_helper"

RSpec.describe "the amusement_parks show page" do 
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @mike = Mechanic.create!(name: "Mike", years_experience: 3)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @mike_hurler = MechanicsRide.create!(ride: @hurler, mechanic: @mike)
    @mike_scrambler = MechanicsRide.create!(ride: @scrambler, mechanic: @mike)
    @mike_ferris = MechanicsRide.create!(ride: @ferris, mechanic: @mike)

    @bob = Mechanic.create!(name: "Bob", years_experience: 10)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    @pukie = @universal.rides.create!(name: 'The Pukie', thrill_rating: 9, open: true)
    @rattler = @universal.rides.create!(name: 'The Rattler', thrill_rating: 8, open: true)

    @bob_jaws = MechanicsRide.create!(ride: @jaws, mechanic: @bob)
    @bob_pukie = MechanicsRide.create!(ride: @pukie, mechanic: @bob)
    @bob_rattler = MechanicsRide.create!(ride: @rattler, mechanic: @bob)
    
  end

  describe "as a user" do
    context "amusement park header" do 
      it "renders the amusement park's name and admission's price" do 
        visit "/amusement_parks/#{@six_flags.id}"

        within(".amusement_park_header") do 
          expect(page).to have_content("Amusement Park: #{@six_flags.name}")
          expect(page).to have_content("Price of Admissions: #{@six_flags.admission_cost}")

          expect(page).to_not have_content("Amusement Park: #{@universal.name}")
          expect(page).to_not have_content("Price of Admissions: #{@universal.admission_cost}")
        end
      end
    end

    context "mechanics working on rides" do 
      it "renders the names of all mechanics working on a ride at that park" do 
        visit "/amusement_parks/#{@six_flags.id}"

        within(".mechanics_on_rides") do 
          expect(page).to have_content("Mechanics with assignments:")
          expect(page).to have_content("Mike")
          expect(page).to_not have_content("Bob")
        end
      end
    end

  end
end