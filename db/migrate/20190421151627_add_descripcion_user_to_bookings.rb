class AddDescripcionUserToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :descripcion, :string
  end
end
