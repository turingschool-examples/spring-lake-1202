class AmusementPark < ApplicationRecord
  has_many :rides, dependent: :destroy
end
