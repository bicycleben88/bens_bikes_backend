class AddMigrationToFixDb < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :item_id
  end
end
