class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @property = Property.find(params[:property_id])
    @checkin_date = Date.parse(params[:checkin_date])
    @checkout_date = Date.parse(params[:checkout_date])

    @total_nights = numberOfNights

    @base_fare = @property.price * @total_nights
    @service_fee = @base_fare * 0.18
    @total_amount = @base_fare + @service_fee
  end

  private

  def numberOfNights
    checkin_date = Date.parse(params[:checkin_date])
    checkout_date = Date.parse(params[:checkout_date])
    (checkout_date - checkin_date).to_i
  end

  def booking_params
    params.permit(:property_id, :checkin_date, :checkout_date)
  end
end
