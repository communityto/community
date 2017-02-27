class AddToSpacesCapacityBathrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :capacity, :integer
    add_column :spaces, :bathrooms, :integer
    add_column :spaces, :size, :string
  end
end
