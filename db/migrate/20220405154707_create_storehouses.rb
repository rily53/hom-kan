class CreateStorehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :storehouses do |t|
      t.string :folder_name, null: false

      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
