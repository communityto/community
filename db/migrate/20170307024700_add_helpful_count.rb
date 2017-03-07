class AddHelpfulCount < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :helpful_count, :integer, :default => 0
  end
end
