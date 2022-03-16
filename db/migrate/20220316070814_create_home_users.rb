class CreateHomeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :home_users do |t|
      t.references :home, null: false, goreign_key: true
      t.references :user, null: false, goreign_key: true

      t.timestamps
    end
  end
end
