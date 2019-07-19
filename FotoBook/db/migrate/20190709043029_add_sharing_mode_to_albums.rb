class AddSharingModeToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :sharingMode, :integer
  end
end
