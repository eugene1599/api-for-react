class FixJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :races, :users
    create_join_table :races, :drivers do |t|
      t.index [:race_id, :driver_id]
      t.index [:driver_id, :race_id]
    end
  end
end
