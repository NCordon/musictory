class CreateOperacion < ActiveRecord::Migration[5.0]
  def change
    create_table :operacion do |t|
      t.integer :cantidad
      t.decimal :facturacion
      t.string :descripcion
      t.date :fecha
      t.references :disco, foreign_key: true

      t.timestamps
    end
  end
end
