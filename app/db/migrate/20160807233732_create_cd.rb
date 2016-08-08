class CreateCd < ActiveRecord::Migration[5.0]
  def change
    create_table :cd do |t|
      t.integer :cantidad
      t.references :catalogo, foreign_key: true

      t.timestamps
    end
  end
end
