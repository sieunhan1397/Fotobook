class ChangeColumnNamePhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :sharingMode, :sharing_mode
    rename_column :albums, :sharingMode, :sharing_mode
  end
end
