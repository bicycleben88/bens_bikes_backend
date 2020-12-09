class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :order_id, :integer
    add_foreign_key :items, :orders
  end
end
