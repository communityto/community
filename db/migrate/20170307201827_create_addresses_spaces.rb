class CreateAddressesSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses_spaces do |t|
      t.integer "address_id"
      t.integer "space_id"
    end
  end
end
