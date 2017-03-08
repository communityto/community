class AddSpaceIDtoAddresses < ActiveRecord::Migration[5.0]
  def change
    drop_table :addresses_spaces
    add_column :addresses, :space_id, :integer
  end
end
