class PropertiesController < ApplicationController

  def show
    @property = Property.find(params[:id])
    @overall_rating_counts = @property
                              .reviews
                              .group('ROUND(final_rating)')
                              .count
                              .transform_keys(&:to_i)
  end
end
