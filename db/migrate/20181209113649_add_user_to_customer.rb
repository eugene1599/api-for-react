class AddUserToCustomer < ActiveRecord::Migration[5.0]
  def change
    change_table :customers do |t|
      t.references :user, index: true
    end
  end
end
