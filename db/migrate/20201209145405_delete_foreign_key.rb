class DeleteForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :items, :orders
    remove_column :items, :order_id
  end
end
