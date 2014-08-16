Spree::Admin::ProductsController.class_eval do
  def neighbors
    locatable = @product.location
    locatable.neighbors_settings = locatable.neighbors_settings || Spree::NeighborsSettings.create(:location_id => locatable.id ,:radius => 0, :count => 0, :sort => 1)
    @neighbors_settings = locatable.neighbors_settings
    neighbors = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id).map { |neighbor| neighbor.location_id}
    @locatables = Spree::Location.where(locatable_type: 'Spree::Product').where.not(locatable_id: @product.id).where.not(id: neighbors).map { |location| [location.locatable.name, location.id]}
    @neighbors_locatables = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id).map { |neighbor| [Spree::Location.find(neighbor.location_id).locatable.name, neighbor.location_id, neighbor]}
    @properties = Spree::Property.all.map{|property| [property.name, property.id]}
    @sorting_options = [['By Distance', 1], ['By Name', 2]]
    @sorting_selected = @neighbors_settings.sort
    @property_selected = @neighbors_settings.neighbors_by_property.nil? ? -1 : @neighbors_settings.neighbors_by_property.property_id
    @property_selected_value = @neighbors_settings.neighbors_by_property.nil? ? "" : @neighbors_settings.neighbors_by_property.value
  end
end


