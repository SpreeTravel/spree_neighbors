module Spree
  module Admin
    module NeighborsSettingsHelper

      def get_name_from_locatable(item)
        item.locatable.name
      end

      def try_set_neighbor_settings_for_locatable(item)
        item.neighbors_settings = item.neighbors_settings || Spree::NeighborsSettings.create(:location_id => item.id)
      end

      def get_neighbors_pins_coordinates(item)
        neighbors_settings = item.neighbors_settings
        unless neighbors_settings.nil?
          neighbors_ids = Spree::Neighbors.where(neighbors_settings_id: neighbors_settings.id).map { |neighbor| neighbor.location_id}
          nearby_items = Spree::Location.where.(locatable_type: item.locatable_type).where.not(id: item.id).where.not(id: neighbors_ids).near([item.latitude, item.longitude], neighbors_settings.radius).map { |locatable| {:latitude => locatable.latitude, :longitude => locatable.longitude, :distance => item.distance_from([locatable.latitude, locatable.longitude]) } }
          neighbors = Spree::Neighbors.where(neighbors_settings_id: neighbors_settings.id).map { |neighbor| {:latitude => neighbor.location.latitude, :longitude => neighbor.location.longitude, :distance => item.distance_from([neighbor.location.latitude, neighbor.location.longitude]) }}
          raise "Pill"
        end
      end

    end
  end
end