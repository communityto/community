class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :title
      t.text :description
      t.string :address
      t.datetime :check_in
      t.datetime :check_out
      t.integer :price
      t.text :rules

      t.timestamps
    end
  end
end
