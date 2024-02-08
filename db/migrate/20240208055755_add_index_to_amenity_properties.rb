class AddIndexToAmenityProperties < ActiveRecord::Migration[7.0]
  def change
    add_index :property_amenities, [:amenity_id, :property_id], unique: true
  end
end
