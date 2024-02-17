class PropertiesController < ApplicationController

  def show
    @property = Property.includes(:reviews).find(params[:id])
    @overall_rating_counts = @property
                              .reviews
                              .group('ROUND(final_rating)')
                              .count
                              .transform_keys(&:to_i)
    
    @overall_rating_counts.default = 0

    upcoming_reservations = @property.reservations.upcoming_reservations.pluck(:checkin_date, :checkout_date)
    @blocked_dates = upcoming_reservations.map { |reservation| [reservation[0].to_s, (reservation[1] - 1.day).to_s] }
  end
end
