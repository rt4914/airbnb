module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_property, only: [:edit, :update, :update_amenities]

    def index
      @properties = current_user.properties
    end

    def update
      if @property.update!(property_params)
        redirect_to edit_owner_property_path, notice: 'Property updated successfully'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Failed to update property'
      end
    end


    def update_amenities
      if @property.update!(amenities_params)
        redirect_to edit_owner_property_path, notice: 'Amenities updated successfully'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Failed to update amenities'
      end
    end

    private

    def set_property
      @property = current_user.properties.find(params[:id])
    end

    def amenities_params
      params.require(:property).permit(:amenity_ids => [])
    end

    def property_params
      params.require(:property).permit(
        :name,
        :price,
        :headine,
        :description,
        :address_1,
        :address_2,
        :city,
        :state,
        :country_code
      )
    end
  end
end
