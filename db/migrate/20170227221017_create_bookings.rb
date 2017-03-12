class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :space_id
      t.datetime :start_time
      t.datetime :end_time
      t.text :note

      t.timestamps
    end
  end
end
