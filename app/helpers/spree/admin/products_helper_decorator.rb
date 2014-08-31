Spree::ProductsHelper.module_eval do

  def get_name_from_locatable(item)
    location_item = Spree::Location.find_by_id(item)
    location_item.locatable.name
  end

  def get_neighbors_pins_coordinates(item)
    by_distance = item.neighbors_ids_by_distance
    by_choice = item.neighbors_ids_by_choice
    by_property = item.neighbors_ids_by_property
    union = by_choice
    if by_property
      union = union | by_distance & by_property
    else
      union = union | by_distance
    end
    list = Spree::Location.where(:id => union).to_a.compact.map do |location|
      {
        :latitude => location.latitude,
        :longitude => location.longitude,
        :distance => item.distance_from([location.latitude, location.longitude]),
        :locatable_id => location.id
      }
    end

    sorted = list
    if item.neighbors_settings
      case item.neighbors_settings.sort
        when 2 then sorted = list.sort_by { |neighbor| Spree::Location.find(neighbor[:locatable_id]).locatable.name }
        when 1 then sorted = list.sort_by { |neighbor| neighbor[:distance] }
      end
    end
    sorted = sorted[0,item.neighbors_settings.count] if item.neighbors_settings.count > 0
    sorted
  end

  def neighbors_map(product)
    products = []
    products << product
    unless product.location.nil?
      neighbors = get_neighbors_pins_coordinates(product.location)
      neighbors.each do |location|
        products << Spree::Location.find(location[:locatable_id]).locatable
      end
    end
    products_map(products)
  end

  def provide_products(product)
    products = []
    unless product.location.nil?
      neighbors = get_neighbors_pins_coordinates(product.location)
      neighbors.each do |location|
        products << Spree::Location.find(location[:locatable_id]).locatable
      end
    end
    products
  end
end
