require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before(:each) do
    @jelly = Mechanic.create!(name: "Jelly Parlor", years_experience: 12)
    @turbinator = Ride.create!(name: 'The Turbinator', thrill_rating: 1, open: true)
    @juicer = Ride.create!(name: 'The Juicer', thrill_rating: 9, open: false)

    RideMechanic.create!(ride_id: @juicer.id, mechanic_id: @jelly.id)
  end

  it 'displays attributes' do
    visit "mechanics/#{@jelly.id}"

    expect(page).to have_content(@jelly.name)
    expect(page).to have_content("Years of Experience: #{@jelly.years_experience}")
    expect(page).to have_content("Rides Responsible: #{@juicer.name}")
  end
end