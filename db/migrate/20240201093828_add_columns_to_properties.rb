class AddColumnsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :guest_count, :integer, default: 0
    add_column :properties, :bedroom_count, :integer, default: 0
    add_column :properties, :bed_count, :integer, default: 0
    add_column :properties, :bathroom_count, :integer, default: 0
  end
end
