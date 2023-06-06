require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @jelly = @six_flags.mechanics.create!(name: "Jelly Parlor", years_experience: 12)
    @turbinator = @six_flags.rides.create!(name: 'The Turbinator', thrill_rating: 1, open: true)
    @juicer = @six_flags.rides.create!(name: 'The Juicer', thrill_rating: 9, open: false)

    RideMechanic.create!(ride_id: @juicer.id, mechanic_id: @jelly.id)
  end

  it 'displays attributes' do
    visit "mechanics/#{@jelly.id}"

    expect(page).to have_content(@jelly.name)
    expect(page).to have_content("Years of Experience: #{@jelly.years_experience}")
    within("#rides") do
      expect(page).to have_content("Rides Responsible:")
      expect(page).to have_content("#{@juicer.name}")
    end
  end
end