class CreatePedido < ActiveRecord::Migration[5.0]
  def change
    create_table :pedido do |t|
      t.references :catalogo, foreign_key: true
      t.integer :cantidad
      t.decimal :adeudo
      t.datetime :fecha_realizacion
      t.datetime :fecha_entrada
      t.datetime :fecha_defecto
      t.datetime :fecha_cancelacion
      t.datetime :fecha_finalizacion
      #t.references :proveedor, foreign_key: true
      t.string :formato

      t.timestamps
    end
  end
end
