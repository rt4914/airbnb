class AddIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:user_id, :property_id, :checkin_date, :checkout_date], unique: true, name: "add_index_to_reservations"
  end
end
