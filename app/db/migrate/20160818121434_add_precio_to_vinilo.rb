class AddPrecioToVinilo < ActiveRecord::Migration[5.0]
  def change
    add_column :vinilo, :precio, :decimal, precision: 5, scale: 2
  end
end
