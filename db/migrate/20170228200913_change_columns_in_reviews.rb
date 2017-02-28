class ChangeColumnsInReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :title, :string
    remove_column :reviews, :rating, :integer
    add_column :reviews, :accuracy, :integer
    add_column :reviews, :communication, :integer
    add_column :reviews, :facilities, :integer
    add_column :reviews, :location, :integer
  end
end
