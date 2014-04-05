module Spree
  module Admin
    module NeighborsSettingsHelper

      def get_name_from_locatable(item)
        item.locatable.name
      end

      def try_set_neighbor_settings_for_locatable(item)
        item.neighbors_settings = item.neighbors_settings || Spree::NeighborsSettings.create(:location_id => item.id)
      end

      def get_property_from_neighbors_settings(neighbors_settings)
        if neighbors_settings.neighbors_by_property.nil?
          -1
        else
          neighbors_settings.neighbors_by_property.property_id
        end
      end

      def get_property_value_from_neighbors_settings(neighbors_settings)
        if neighbors_settings.neighbors_by_property.nil?
          ""
        else
          neighbors_settings.neighbors_by_property.value
        end
      end

    end
  end
end