class AddDireccionToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :direccion, :string
  end
end
