class RemoveRideFromMechanics < ActiveRecord::Migration[7.0]
  def change
    remove_reference :mechanics, :ride, null: false, foreign_key: true
  end
end
