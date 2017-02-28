class Changetables < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :type, :name
    rename_column :amenities, :type, :name
    add_column :spaces, :host_id, :integer
  end
end
