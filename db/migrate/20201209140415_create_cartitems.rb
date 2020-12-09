class CreateCartitems < ActiveRecord::Migration[6.0]
  def change
    create_table :cartitems do |t|
      t.references :order, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
