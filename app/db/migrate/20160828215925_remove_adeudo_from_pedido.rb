class RemoveAdeudoFromPedido < ActiveRecord::Migration[5.0]
  def change
    remove_column :pedido, :adeudo, :decimal
  end
end
