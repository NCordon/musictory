class AddForeignKeyToDisco < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :operacion, :disco, column: :disco_id, primary_key: "id"
  end
end
