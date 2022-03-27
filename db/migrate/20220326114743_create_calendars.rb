class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :title, null: false
      t.text :schedule
      t.string :member
      t.date :start_date, null: false
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
