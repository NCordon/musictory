class DropReferenceFromPedidoToCatalogo < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pedido, :catalogo, index: true
  end
end
