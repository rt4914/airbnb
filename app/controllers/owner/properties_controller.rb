module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!

    def index
    end
  end
end
