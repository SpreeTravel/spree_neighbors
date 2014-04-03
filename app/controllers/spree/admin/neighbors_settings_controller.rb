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

        neighbors_setting.neighbors_by_property ||= Spree::NeighborsByProperty.new()
        neighbors_setting.neighbors_by_property.property_id = property_id
        neighbors_setting.neighbors_by_property.value = property_value

        unless(params[:neighbors].nil?)
          neighbors = params[:neighbors].split(",")
          manual_neighbors = []

          neighbors.each do |locatable|
            manual_neighbors << (Spree::Neighbors.create(:neighbors_settings_id => neighbors_setting.id, :location_id => locatable))
          end
        end

        neighbors_setting.radius = radius
        neighbors_setting.neighbors_by_property.save()

        if neighbors_setting.save()
          flash[:success] = t(:successfully_updated_settings)
        else
          flash[:error] = t(:fail_updated_settings)
        end

        redirect_to :back
      end

      def delete_neighbor
        print "Pill"
        print @neighbors_setting
        print params
        flash[:success] = "Neighbor successfully removed."
        render :partial => "spree/admin/shared/destroy"
      end

    end
  end
end