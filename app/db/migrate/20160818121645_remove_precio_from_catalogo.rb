class RemovePrecioFromCatalogo < ActiveRecord::Migration[5.0]
  def change
    remove_column :catalogo, :precio, :decimal
  end
end
