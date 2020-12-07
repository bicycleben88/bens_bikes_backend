class CreateFixPriceColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :fix_price_columns do |t|
        remove_column :items, :price 
        add_column :items, :price, :decimal, precision: 6, scale: 2
      t.timestamps
    end
  end
end
