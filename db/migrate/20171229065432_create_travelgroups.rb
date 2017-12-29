class CreateTravelgroups < ActiveRecord::Migration[5.1]
  def change
    create_table :travelgroups do |t|
      t.integer :trip_id
      t.integer :traveller_id
      
      t.timestamps
    end
  end
end
