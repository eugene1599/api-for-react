class FixRaceTable < ActiveRecord::Migration[5.0]
  def change
    change_table :races do |t|
      t.remove :start_date
      t.remove :end_date
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
