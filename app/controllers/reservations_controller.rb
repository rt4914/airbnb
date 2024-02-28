class ReservationsController < ApplicationController
  def show
    @reservations = current_user.reservations
  end
end
