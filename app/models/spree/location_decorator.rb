Spree::Location.class_eval do
  has_one :neighbors_settings, class_name: "Spree::NeighborsSettings"
  accepts_nested_attributes_for :neighbors_settings, :allow_destroy => true
  #Fields for the geocoder gem
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def neighbors_ids_by_distance
    settings = self.neighbors_settings
    return [] if settings.nil?
    return [] if settings.radius == 0
    nearby_items = Spree::Location.where(locatable_type: self.locatable_type)
    nearby_items = nearby_items.where.not(id: self.id)
    nearby_items = nearby_items.near([self.latitude, self.longitude], settings.radius)
    #nearby_items = nearby_items.limit(settings.count)
    nearby_items = nearby_items.pluck(:id)
    nearby_items
  end

  def neighbors_ids_by_choise
    settings = self.neighbors_settings
    return [] if settings.nil?
    neighbors_ids = Spree::Neighbors.where(neighbors_settings_id: settings.id)
    #neighbots_ids = neighbors_ids.limit(settings.count)
    neighbors_ids = neighbors_ids.pluck(:location_id)
    neighbors_ids
  end

  def neighbors_ids_by_property
    settings = self.neighbors_settings
    return nil if settings.nil?
    return nil if settings.neighbors_by_property.nil?
    pp = Spree::ProductProperty.where(property_id: settings.neighbors_by_property.property_id)
    pp = pp.where(value: settings.neighbors_by_property.value) if settings.neighbors_by_property.value.present?
    neighbors_ids = pp.map { |p| p.product.location.id rescue nil }.compact
    neighbors_ids
  end
end
