class AddAlbumToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :album, foreign_key: true
  end
end
