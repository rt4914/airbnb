class PropertiesController < ApplicationController

  def show
    @property = Property.includes(:reviews).find(params[:id])
    @overall_rating_counts = @property
                              .reviews
                              .group('ROUND(final_rating)')
                              .count
                              .transform_keys(&:to_i)
    
    @overall_rating_counts.default = 0
  end
end
