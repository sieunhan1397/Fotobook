class RemoveAvatarFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :avatar
  end

  def down
    add_column :users, :avatar, :string
  end
end
