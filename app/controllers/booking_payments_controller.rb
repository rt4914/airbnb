class BookingPaymentsController < ApplicationController
  def create
    @property = Property.find(booking_payments_params[:property_id])

    stripe_price = Stripe::Price.create({
      currency: 'usd',
      unit_amount: Money.from_amount(BigDecimal(booking_payments_params[:total_amount])).cents,
      product_data: {
        name: @property.name
      },
    })

    success_url = url_for(
      controller: 'booking_payments', 
      action: 'success', 
      only_path: false, 
      booking_params: booking_payments_params.except(:stripeToken)
    )

    stripe_session = Stripe::Checkout::Session.create({
      success_url: success_url,
      line_items: [
        {
          price: stripe_price.id,
          quantity: 1,
        },
      ],
      mode: 'payment',
    })

    redirect_to stripe_session.url, allow_other_host: true, status:303
  end

  def success
    booking_params = params[:booking_params]
    
    reservation = Reservation.create!(
      user_id: current_user.id,
      property_id: booking_params[:property_id],
      checkin_date: booking_params[:checkin_date],
      checkout_date: booking_params[:checkout_date]
    )

    payment = Payment.create!(
      reservation_id: reservation.id,
      base_fare: Money.from_amount(BigDecimal(booking_params[:base_fare])),
      service_fee: Money.from_amount(BigDecimal(booking_params[:service_fee])),
      total_amount: Money.from_amount(BigDecimal(booking_params[:total_amount])),
    )
    
    # TODO: redirect to all bookings page
    redirect_to root_path
  end

  private

  def booking_payments_params
    params.permit(
      :stripeToken,
      :property_id, 
      :checkin_date, 
      :checkout_date, 
      :base_fare, 
      :service_fee,
      :total_amount
    )
  end
end
