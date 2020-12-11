class AddForeignKeyOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :user_id, :integer
    add_foreign_key :orders, :users
  end
end
