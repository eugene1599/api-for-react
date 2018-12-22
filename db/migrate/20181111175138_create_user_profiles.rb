class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true, index: true
      t.string :avatar
      t.text :information

      t.timestamps
    end
  end
end
