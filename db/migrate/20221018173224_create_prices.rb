class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.decimal :open_price
      t.decimal :highest_price
      t.decimal :lowest_price
      t.decimal :volume
      t.decimal :close_price
      t.date :date
      t.integer :ticket_id
      
      t.timestamps
    end
  end
end
