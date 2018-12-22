class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.time :start_date
      t.time :end_date
      t.references :car, foreign_key: true
      t.references :customer, foreign_key: true
      t.float :cargo_weight

      t.timestamps
    end
  end
end
