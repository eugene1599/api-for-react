class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :task, index: true, foreign_key: true

      t.timestamps
    end
  end
end
