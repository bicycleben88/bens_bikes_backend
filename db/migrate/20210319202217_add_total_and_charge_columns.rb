class AddTotalAndChargeColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total, :integer
    add_column :orders, :charge, :string
  end
end
