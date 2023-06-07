class AmusementPark < ApplicationRecord
  has_many :rides, dependent: :destroy

  # instance methods
  def names_of_mechanics_working
    rides
      .joins(:mechanics)
      .select("mechanics.*")
      .distinct
      .pluck("mechanics.name")
  end
end
