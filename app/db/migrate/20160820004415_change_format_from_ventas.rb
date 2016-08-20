class ChangeFormatFromVentas < ActiveRecord::Migration[5.0]
  def change
    change_column :venta, :formato, :integer
  end
end
