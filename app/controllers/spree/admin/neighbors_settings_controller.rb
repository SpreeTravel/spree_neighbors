module Spree
  module Admin
    class NeighborsSettingsController < Spree::Admin::BaseController

      def edit
        @collection = Spree::Location.all
      end

      def update
        neighbors_setting = Spree::NeighborsSettings.find(params[:neighbors_setting_id])
        radius = params[:radius_active] == '1' ? (Integer(params[:radius]) > 0 ? Integer(params[:radius]) : 0) : 0

        property_id = params[:properties_active] == '1' ? params[:property_id] : '0'
        property_value = params[:properties_active] == '1' ? params[:property_value] : ""
        neighbor_by_property = neighbors_setting.neighbors_by_property || Spree::NeighborsByProperty.new()
        neighbor_by_property.neighbors_settings_id = neighbors_setting.id
        neighbor_by_property.property_id = property_id
        neighbor_by_property.value = property_value

        neighbors = params[:neighbors].split(",")
        manual_neighbors = []
        neighbors.each do |locatable|
          manual_neighbors << (Spree::Neighbors.new(:location_id => locatable))
        end

        neighbors_setting.radius = radius
        neighbors_setting.neighbors_by_property = neighbor_by_property
        neighbors_setting.neighbors = manual_neighbors
        neighbors_setting.save()
        redirect_to :back
      end


    end
  end
end