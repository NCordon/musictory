class AddObservacionesToVenta < ActiveRecord::Migration[5.0]
  def change
    add_column :venta, :observaciones, :string
  end
end
