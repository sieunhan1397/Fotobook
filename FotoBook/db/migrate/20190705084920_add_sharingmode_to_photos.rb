class AddSharingmodeToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :sharingMode, :integer
  end
end
