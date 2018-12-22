class AddUserToModels < ActiveRecord::Migration[5.0]
  def change
    change_table :races do |t|
      t.references :user, index: true
    end
    change_table :cars do |t|
      t.references :user, index: true
    end
    change_table :drivers do |t|
      t.references :user, index: true
    end
  end
end
