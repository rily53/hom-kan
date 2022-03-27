class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string  :task, null: false
      t.date    :deadline, null: false
      t.string  :responsible_person
      t.integer :status_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
