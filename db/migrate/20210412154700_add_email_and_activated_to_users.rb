class AddEmailAndActivatedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activated, :boolean, default: false
    add_column :users, :email, :string
  end
end
