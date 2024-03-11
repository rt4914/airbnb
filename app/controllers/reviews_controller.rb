class ReviewsController < ApplicationController
  before_action :set_reservation, only: [:new, :create]

  def create
    @review = current_user.reviews.new(review_params.merge(property_id: @reservation.property_id))

    if @review.save
      redirect_to root_path, notice: 'Review added successfully'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to add review'
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def review_params
    params.permit(
      :user_id,
      :content,
      :cleanliness_rating,
      :accuracy_rating,
      :checkin_rating,
      :communication_rating,
      :location_rating,
      :value_rating
    )
  end
end
