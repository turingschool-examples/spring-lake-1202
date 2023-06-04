class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_cost
  has_many :rides
end