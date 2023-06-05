class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def avg_exp
    self.mechanics.average(:years_experience).to_f
  end
end