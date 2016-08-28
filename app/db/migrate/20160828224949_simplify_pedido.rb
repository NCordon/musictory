class SimplifyPedido < ActiveRecord::Migration[5.0]
  def change
    remove_column :pedido, :fechaDefecto, :datetime
    remove_column :pedido, :fechaFinalizacion, :datetime
  end
end
