class AddOrderItemsReferenceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :order_items, foreign_key: true
  end
end
