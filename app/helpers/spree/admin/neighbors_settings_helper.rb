module Spree
  module Admin
    module NeighborsSettingsHelper

      def get_name_from_locatable(item)
        item.locatable.name
      end

      def try_set_neighbor_settings_for_locatable(item)
        item.neighbors_settings = item.neighbors_settings || Spree::NeighborsSettings.create(:location_id => item.id)
      end

    end
  end
end