class AddPrecioToCd < ActiveRecord::Migration[5.0]
  def change
    add_column :cd, :precio, :decimal, precision: 5, scale: 2
  end
end
