class AddPrecioToCd < ActiveRecord::Migration[5.0]
  def change
    add_column :cd, :precio, :decimal
  end
end
