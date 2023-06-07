class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def men_at_work
    mechanics.distinct
  end
end