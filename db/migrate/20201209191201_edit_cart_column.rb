class EditCartColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :cartitems, :price
    add_column :cartitems, :price, :decimal, precision: 6, scale: 2
  end
end
