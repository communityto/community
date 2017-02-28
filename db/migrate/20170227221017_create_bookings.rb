class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :space_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :note

      t.timestamps
    end
  end
end
