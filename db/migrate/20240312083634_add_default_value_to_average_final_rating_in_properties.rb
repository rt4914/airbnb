class AddDefaultValueToAverageFinalRatingInProperties < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :average_final_rating, :decimal, default: 0
  end
end
