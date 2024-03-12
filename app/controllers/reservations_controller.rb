class ReservationsController < ApplicationController
  before_action :authenticate_user!
  # TODO: Order- show latest first, same for other apis
  def index
    @reservations = current_user.reservations
  end
end
