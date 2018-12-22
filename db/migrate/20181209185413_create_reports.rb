class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :mileage, null: false
      t.float :fuel, null: false
      t.float :fuel_cost, null: false
      t.references :race, foreign_key: true, index: true

      t.timestamps
    end
  end
end
