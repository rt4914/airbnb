class AddColumnToAmenities < ActiveRecord::Migration[7.0]
  def change
    add_column :amenities, :icon, :string
  end
end
