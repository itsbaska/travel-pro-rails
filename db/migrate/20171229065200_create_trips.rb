class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.decimal :budget
      t.date :start_date
      t.date :end_date
      t.date :start_date_formatted
      t.date :end_date_formatted
      t.integer :organizer_id
      t.string :organizer_name

      t.timestamps
    end
  end
end
