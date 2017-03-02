class AddAvatarToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :avatar, :string
  end
end
