module Spree
  module Admin
    class NeighborsSettingsController < Spree::Admin::BaseController

      def edit
        @collection = Spree::Location.all
      end

      def update
        neighbors_quantity = params[:quantity_active] == '1' ? (Integer(params[:neighbors_quantity]) > 0 ? Integer(params[:neighbors_quantity]) : 0) : 0
        neighbors_setting = Spree::NeighborsSettings.find(params[:neighbors_setting_id])
        radius = params[:radius_active] == '1' ? (Integer(params[:radius]) > 0 ? Integer(params[:radius]) : 0) : 0

        property_id = params[:properties_active] == '1' ? params[:property_id] : '0'
        property_value = params[:properties_active] == '1' ? params[:property_value] : ""

        neighbors_setting.neighbors_by_property ||= Spree::NeighborsByProperty.new()
        neighbors_setting.neighbors_by_property.property_id = property_id
        neighbors_setting.neighbors_by_property.value = property_value

        neighbors_setting.radius = radius
        neighbors_setting.neighbors_by_property.save()

        if neighbors_setting.save()
          flash[:success] = t(:successfully_updated_settings)
        else
          flash[:error] = t(:fail_updated_settings)
        end

        redirect_to :back
      end

    end
  end
end