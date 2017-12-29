class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.decimal :total
      t.string :store
      t.integer :trip_id
      t.integer :purchaser_id
      t.string :photo

      t.timestamps
    end
  end
end
