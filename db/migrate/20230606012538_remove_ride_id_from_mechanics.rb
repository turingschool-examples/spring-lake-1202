class RemoveRideIdFromMechanics < ActiveRecord::Migration[7.0]
  def change
    remove_column :mechanics, :ride_id, :integer
  end
end
