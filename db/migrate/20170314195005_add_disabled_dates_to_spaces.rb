class AddDisabledDatesToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :disabled_dates, :datetime, array: true, default: []
  end
end
