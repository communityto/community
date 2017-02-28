class AmenitiesSpaces < ActiveRecord::Migration[5.0]
  def change
    create_join_table :amenities, :spaces do |t|
      t.integer :amenity_id
      t.integer :space_id
    end
  end
end
