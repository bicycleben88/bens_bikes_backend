class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :largeimage
      t.string :descriptiion
      t.decimal :price, precision: 10, scale: 2
      t.integer :qty

      t.timestamps
    end
  end
end
