require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides)}
  end

  describe "instance methods" do
    describe "#list_of_mechanics" do
      it "returns the mechanics that work on wach ride uniquely" do
        six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
        huler = six_flags.rides.create!(name: "The Huler", thrill_rating: 7, open: false)
        jumper = six_flags.rides.create!(name: "The Jumper", thrill_rating: 4, open: true)
        skipper = six_flags.rides.create!(name: "Great Skipper", thrill_rating: 7, open: false)

        mechanic_1 = Mechanic.create!(name:"Kara Smith", years_experience: 11)
        mechanic_2 = Mechanic.create!(name:"Jon Doe", years_experience: 2)
        mechanic_3 = Mechanic.create!(name:"Jane Washington", years_experience: 6)

        RideMechanic.create!(ride: huler, mechanic: mechanic_1)
        RideMechanic.create!(ride: jumper, mechanic: mechanic_1)
        RideMechanic.create!(ride: huler, mechanic: mechanic_2)
        RideMechanic.create!(ride: jumper, mechanic: mechanic_2)

        expect(six_flags.list_of_mechanics).to eq([mechanic_1, mechanic_2])
      end
    end
  end
end