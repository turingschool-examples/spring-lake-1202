require "rails_helper"

RSpec.describe Mechanic do
  describe "instance methods" do
    it "rides_working_on" do
      @park_1 = AmusementPark.create!(name: "Fun land", admission_cost: 50)
      @ride_1 = @park_1.rides.create!(name: "Twister", thrill_rating: 8, open: true)
      @ride_2 = @park_1.rides.create!(name: "Snake", thrill_rating: 7, open: true)
      @mechanic_1 = Mechanic.create(name: "Bill", years_experience: 12, ride_id: @ride_1.id)
      RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
      RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)

      expect(@mechanic_1.rides_working_on).to match_array([@ride_1, @ride_2])
    end
  end
end