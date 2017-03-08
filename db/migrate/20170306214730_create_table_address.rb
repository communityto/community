class CreateTableAddress < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :region
    end
  end
end
