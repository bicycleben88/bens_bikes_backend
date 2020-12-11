class EditOrdersColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :qty
    add_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
