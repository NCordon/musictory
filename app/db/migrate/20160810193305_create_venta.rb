class CreateVenta < ActiveRecord::Migration[5.0]
  def change
    create_table :venta do |t|
      t.references :catalogo, foreign_key: true
      t.decimal :precio
      t.datetime :fecha_venta
      t.string :formato

      t.timestamps
    end
  end
end
