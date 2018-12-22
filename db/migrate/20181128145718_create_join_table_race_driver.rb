class CreateJoinTableRaceDriver < ActiveRecord::Migration[5.0]
  def change
    create_join_table :races, :users do |t|
      t.index [:race_id, :user_id]
      t.index [:user_id, :race_id]
    end
  end
end
