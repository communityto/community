class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :title
      t.text :description
      t.string :address
      t.time :check_in
      t.time :check_out
      t.integer :price
      t.text :rules
      t.integer :capacity
      t.integer :bathrooms
      t.integer :size

      t.timestamps
    end
  end
end
