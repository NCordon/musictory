class SimplifyPedido < ActiveRecord::Migration[5.0]
  def change
    remove_column :pedido, :fecha_defecto, :datetime
    remove_column :pedido, :fecha_finalizacion, :datetime
  end
end
