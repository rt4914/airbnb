class WishlistsController < ApplicationController
  def index
    @properties = current_user.wishlisted_properties
  end
end
