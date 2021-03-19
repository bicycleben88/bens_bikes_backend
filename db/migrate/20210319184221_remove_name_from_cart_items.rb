class RemoveNameFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :cartitems, :name
  end
end
