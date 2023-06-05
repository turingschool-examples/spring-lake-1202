class CreateMechanics < ActiveRecord::Migration[7.0]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_experience
      t.references :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
