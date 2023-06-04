require "rails_helper"

RSpec.describe Mechanic do 
  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_experience}
  end
  describe "relationships" do
    it { should have_many(:rides).through(:mechanic_rides) }
  end
end