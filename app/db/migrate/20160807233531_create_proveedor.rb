class CreateProveedor < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedor do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
