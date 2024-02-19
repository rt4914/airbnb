class BookingsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @checkin_date = params[:checkin_date]
    @checkout_date = params[:checkout_date]

    @total_nights = numberOfNights()

    @base_fair = @property.price * @total_nights
    @service_fee = @base_fair * 0.18
    @total_amount = @base_fair + @service_fee


    # base fare
    # service fee
    # total amount
  end

  private

  def numberOfNights
    checkin_date = Date.parse(params[:checkin_date])
    checkout_date = Date.parse(params[:checkout_date])
    return (checkout_date - checkin_date).to_i
  end

  def booking_params
    params.permit(:property_id, :checkin_date, :checkout_date)
  end
end
