Spree::ProductsHelper.module_eval do
  def get_name_from_locatable(item)
    location_item = Spree::Location.find_by_id(item)
    location_item.locatable.name
  end

  def get_neighbors_pins_coordinates(item)
    neighbors_settings = item.neighbors_settings

    unless neighbors_settings.nil?
      neighbors_ids = Spree::Neighbors.where(neighbors_settings_id: neighbors_settings.id).map { |neighbor| neighbor.location_id}
      nearby_items = neighbors_settings.radius > 0 ? Spree::Location.where(locatable_type: item.locatable_type).where.not(id: item.id).where.not(id: neighbors_ids).near([item.latitude, item.longitude], neighbors_settings.radius).map { |locatable| {:latitude => locatable.latitude, :longitude => locatable.longitude, :distance => item.distance_from([locatable.latitude, locatable.longitude]), :locatable_id => locatable.id } } : []
      neighbors = Spree::Neighbors.where(neighbors_settings_id: neighbors_settings.id).map { |neighbor| {:latitude => neighbor.location.latitude, :longitude => neighbor.location.longitude, :distance => item.distance_from([neighbor.location.latitude, neighbor.location.longitude]), :locatable_id => neighbor.location.id } }
      products_prop = neighbors_settings.neighbors_by_property.nil? ? [] : neighbors_settings.neighbors_by_property.value == "" ? [] : Spree::ProductProperty.where(property_id: neighbors_settings.neighbors_by_property.property_id, value: neighbors_settings.neighbors_by_property.value).map{ |product_prop| product_prop.product }
      neighbors_by_prop = []
      products_prop.each do |prod|
        unless prod.location.nil?
          neighbors_by_prop << {:latitude => prod.location.latitude, :longitude => prod.location.longitude, :distance => item.distance_from([prod.location.latitude, prod.location.longitude]), :locatable_id => prod.location.id }
        end
      end
    end

    union = nearby_items | neighbors | neighbors_by_prop

    #The sorting bussiness goes here

    case neighbors_settings.sort
    when 2
      sorted = union.sort_by { |neighbor| Spree::Location.find(neighbor[:locatable_id]).locatable.name }
    when 1
      sorted = union.sort_by { |neighbor| neighbor[:distance] }
    else
      sorted = union
    end

    result = sorted

    if neighbors_settings.count > 0
      #it does'nt matter if the count is bigger than the amount of items it gets them all
      result = sorted.take(neighbors_settings.count)
    end

    result
  end
end