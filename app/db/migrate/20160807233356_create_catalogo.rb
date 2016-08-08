class CreateCatalogo < ActiveRecord::Migration[5.0]
  def change
    create_table :catalogo do |t|
      t.string :titulo
      t.string :grupo
      t.string :genero
      t.decimal :precio

      t.timestamps
    end
  end
end
