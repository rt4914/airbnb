class WishlistsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @properties = current_user.wishlisted_properties
  end
end
