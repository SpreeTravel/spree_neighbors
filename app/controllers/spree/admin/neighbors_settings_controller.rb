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
        neighbor_by_property = Spree::NeighborsByProperty.new(:neighbors_setting_id => params[:neighbors_setting_id], :property_id => property_id, :value => params[:property_value])
        neighbors = params[:neighbors].split(",")
        manual_neighbors = []
        neighbors.each do |locatable|
          manual_neighbors << (Spree::Neighbors.new(:location_id => locatable))
        end
        neighbors_setting.radius = radius
        neighbors_setting.neighbors_by_property = neighbor_by_property
        neighbors_setting.neighbors = manual_neighbors
        neighbors_setting.save()
        raise "Pill"
        redirect_to :back
      end
    end
  end
end