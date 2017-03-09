class RenameRegionInAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :region, :neighbourhood
  end
end
