require "rails_helper"

RSpec.describe AmusementParksController, type: :controller do
  describe "show page" do
    it "assigns the mechanics working on the amusement park's rides" do
      amusement_park = AmusementPark.create(name: "Six Flags", admission_cost: 75)
      mechanic1 = Mechanic.create(name: "Kara Smith", years_experience: 11)
      mechanic2 = Mechanic.create(name: "John Doe", years_experience: 5)
      ride1 = Ride.create(name: "The Hurler", thrill_rating: 7, open: false, amusement_park_id: amusement_park.id)
      ride2 = Ride.create(name: "Fahrenheit", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
      mechanic1.rides << ride1
      mechanic2.rides << ride2

      get :show, params: { id: amusement_park.id }

      expect(assigns(:amusement_park)).to eq(amusement_park)
      expect(assigns(:mechanics)).to eq([mechanic1, mechanic2])
      expect(response).to render_template(:show)
    end
  end
end

