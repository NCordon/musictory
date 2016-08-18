class AddPrecioToVinilo < ActiveRecord::Migration[5.0]
  def change
    add_column :vinilo, :precio, :decimal
  end
end
