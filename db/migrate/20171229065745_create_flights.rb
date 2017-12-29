class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :airline
      t.datetime :arrival
      t.datetime :departure
      t.string :airport
      t.integer :travelgroup_id
      t.integer :traveller_id
      t.boolean :outbound

      t.timestamps
    end
  end
end
