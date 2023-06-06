require "rails_helper"

RSpec.describe "the amusement_parks show page" do 
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
  end

  describe "as a user" do
    context "amusement park header" do 
      it "renders the amusement park's name and admission's price" do 
        visit "/amusement_parks/#{@six_flags.id}"

        within(".amusement_park_header") do 
          expect(page).to have_content("Amusement Park: #{@six_flags.name}")
          expect(page).to have_content("Price of Admissions: #{@six_flags.admission_cost}")

          expect(page).to have_content("Amusement Park: #{@universal.name}")
          expect(page).to_not have_content("Price of Admissions: #{@universal.admission_cost}")
        end
      end
    end
    
  end
end