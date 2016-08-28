class ChangeFormatoFromPedido < ActiveRecord::Migration[5.0]
  def change
    change_column :pedido, :formato, :integer
  end
end
