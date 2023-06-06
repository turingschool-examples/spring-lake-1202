require "rails_helper"

RSpec.describe MechanicsController, type: :controller do
  describe "show page" do
    it "assigns the requested mechanic" do
      mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
      get :show, params: { id: mechanic.id }
      expect(assigns(:mechanic)).to eq(mechanic)
    end

    it "assigns the rides of the mechanic" do
      mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
      amusement_park = AmusementPark.create(name: "Six Flags", admission_cost: 75)
      ride1 = Ride.create(name: "The Frog Hopper", thrill_rating: 5, open: true, amusement_park: amusement_park)
      ride2 = Ride.create(name: "Fahrenheit", thrill_rating: 8, open: false, amusement_park: amusement_park)
      mechanic.rides << [ride1, ride2]
      get :show, params: { id: mechanic.id }
      expect(assigns(:rides)).to eq([ride1, ride2])
    end

    it "renders the show template" do
      mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
      get :show, params: { id: mechanic.id }
      expect(response).to render_template(:show)
    end
  end

  describe "PUT update" do
    it "adds a ride to the mechanic's workload" do
      mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
      ride = Ride.create(name: "The Hurler", thrill_rating: 7, open: false)
      put :update, params: { id: mechanic.id, ride_id: ride.id }
      expect(mechanic.rides).to include(ride)
    end

    it "redirects to the mechanic's show page" do
      mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
      ride = Ride.create(name: "The Hurler", thrill_rating: 7, open: false)
      put :update, params: { id: mechanic.id, ride_id: ride.id }
      expect(response).to redirect_to(mechanic_path(mechanic))
    end
  end
end
