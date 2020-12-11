class ReverseOrdersColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :total
    add_column :orders, :qty, :integer
  end
end
