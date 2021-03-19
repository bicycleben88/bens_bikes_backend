class RemoveReferenceFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cartitems, :order
  end
end
