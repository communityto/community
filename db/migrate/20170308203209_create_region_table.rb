class CreateRegionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :region do |t|
      t.string :name
    end
  end
end
