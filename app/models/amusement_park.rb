class AmusementPark < ApplicationRecord
  has_many :rides

  def uniq_mechanics
    require 'pry'; binding.pry
  end
end