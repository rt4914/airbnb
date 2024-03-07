class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = current_user.reservations
  end
end
