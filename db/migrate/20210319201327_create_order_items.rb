class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :price
      t.integer :quantity
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
