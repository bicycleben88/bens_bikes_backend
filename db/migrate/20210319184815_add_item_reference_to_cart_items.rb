class AddItemReferenceToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :cartitems, :item, foreign_key: true 
  end
end
