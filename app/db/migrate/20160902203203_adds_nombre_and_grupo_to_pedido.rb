class AddsNombreAndGrupoToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido, :titulo, :string
    add_column :pedido, :grupo, :string
  end
end
