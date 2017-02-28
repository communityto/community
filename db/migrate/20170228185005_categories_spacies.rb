class CategoriesSpacies < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :spaces do |t|
      t.integer :category_id
      t.integer :space_id
    end
  end
end
