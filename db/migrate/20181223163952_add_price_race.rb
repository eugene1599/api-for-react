class AddPriceRace < ActiveRecord::Migration[5.2]
  def change
    change_table :races do |t|
      t.float :race_price, default: 0.0
    end
  end
end
