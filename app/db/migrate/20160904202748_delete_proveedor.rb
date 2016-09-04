class DeleteProveedor < ActiveRecord::Migration[5.0]
  def change
      remove_column :pedido, :proveedor, :integer
      drop_table :proveedor
  end
end
