class RemovePriceFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :cartitems, :price
  end
end
