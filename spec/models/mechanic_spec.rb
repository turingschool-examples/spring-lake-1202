require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  it { should belong_to(:amusement_park) }
  it { should have_many(:rides).through(:ride_mechanics) }
end
