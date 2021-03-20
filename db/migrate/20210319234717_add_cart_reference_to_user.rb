class AddCartReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :cartitems
  end
end
