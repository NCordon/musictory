class CreateDisco < ActiveRecord::Migration[5.0]
  def change
    create_table :disco do |t|
      t.string :titulo
      t.integer :anio
      t.string :grupo

      t.timestamps
    end
  end
end
