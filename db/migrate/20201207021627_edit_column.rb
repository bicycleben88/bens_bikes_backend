class EditColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :descriptiion
    add_column :items, :description, :string
  end
end
