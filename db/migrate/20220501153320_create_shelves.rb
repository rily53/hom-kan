class CreateShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves do |t|
      t.string :file_name, null: false
      t.text :file_memo

      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true
      t.references :storehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
