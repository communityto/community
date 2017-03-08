class RemoveColumnFromSpace < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :address
  end
end
