class RenameColumnsInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :start_time, :start_time
    rename_column :bookings, :end_time, :end_time
  end
end
