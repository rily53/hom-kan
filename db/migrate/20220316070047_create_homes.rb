class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :home_name, null: false, unique: true

      t.timestamps
    end
  end
end
