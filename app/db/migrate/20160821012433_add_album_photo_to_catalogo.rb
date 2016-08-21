class AddAlbumPhotoToCatalogo < ActiveRecord::Migration[5.0]
  def change
    add_attachment :catalogo, :portada
  end
end
