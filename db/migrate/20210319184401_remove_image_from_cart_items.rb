class RemoveImageFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :cartitems, :image
  end
end
