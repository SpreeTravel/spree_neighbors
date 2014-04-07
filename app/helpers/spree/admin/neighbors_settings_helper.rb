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
          nearby_items = neighbors_settings.radius > 0 ? Spree::Location.where(locatable_type: item.locatable_type).where.not(id: item.id).where.not(id: neighbors_ids).near([item.latitude, item.longitude], neighbors_settings.radius).map { |locatable| {:latitude => locatable.latitude, :longitude => locatable.longitude, :distance => item.distance_from([locatable.latitude, locatable.longitude]), :locatable_id => locatable.id } } : []
          neighbors = Spree::Neighbors.where(neighbors_settings_id: neighbors_settings.id).map { |neighbor| {:latitude => neighbor.location.latitude, :longitude => neighbor.location.longitude, :distance => item.distance_from([neighbor.location.latitude, neighbor.location.longitude]), :locatable_id => neighbor.location.id } }
          products_prop = neighbors_settings.neighbors_by_property.nil? ? [] : neighbors_settings.neighbors_by_property.value == "" ? [] : Spree::ProductProperty.where(property_id: item.neighbors_by_property.property_id, value: item.neighbors_by_property.value).map{ |product_prop| product_prop.product }
          neighbors_by_prop = []
          products_prop.each do |prod|
            unless prod.location.nil?
              neighbors_by_prop << {:latitude => prod.location.latitude, :longitude => prod.location.longitude, :distance => item.distance_from([prod.location.latitude, prod.location.longitude]), :locatable_id => prod.location.id }
            end
          end

        end
        #The sorting bussiness goes here
        result = nearby_items + neighbors + neighbors_by_prop
        sorted = result.sort_by { |item| item[:distance] }
        final_result = sorted

        if neighbors_settings.count > 0
          #it does'nt matter if the count is bigger than the amount of items it gets them all
          final_result = sorted.take(neighbors_settings.count)
        end

        final_result

      end

    end
  end
end