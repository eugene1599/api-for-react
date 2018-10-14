class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
