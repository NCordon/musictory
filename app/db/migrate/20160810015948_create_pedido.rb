class CreatePedido < ActiveRecord::Migration[5.0]
  def change
    create_table :pedido do |t|
      t.references :catalogo, foreign_key: true
      t.integer :cantidad
      t.decimal :adeudo
      t.datetime :fechaRealizacion
      t.datetime :fechaEntrada
      t.datetime :fechaDefecto
      t.datetime :fechaCancelacion
      t.datetime :fechaFinalizacion
      t.references :proveedor, foreign_key: true
      t.string :formato

      t.timestamps
    end
  end
end
