class AddAverageFinalRatingToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :average_final_rating, :decimal
  end
end
