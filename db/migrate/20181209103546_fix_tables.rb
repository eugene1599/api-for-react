class FixTables < ActiveRecord::Migration[5.0]
  def up
    change_table :cars do |t|
      t.remove :type
      t.integer :car_type, default: 0, null: false
    end

    change_table :drivers do |t|
      t.remove :type
      t.integer :driver_type, default: 0, null: false
    end
  end

  def down
    change_table :cars do |t|
      t.integer :type, default: 0
      t.remove :car_type
    end

    change_table :drivers do |t|
      t.integer :type, default: 0
      t.remove :driver_type
    end
  end
end
