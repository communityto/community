class AddDeniedToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :denied, :boolean, :default => false
  end
end
