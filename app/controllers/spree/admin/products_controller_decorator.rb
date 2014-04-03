Spree::Admin::ProductsController.class_eval do
  def neighbors
    locatable = @product.location
    locatable.neighbors_settings = locatable.neighbors_settings || Spree::NeighborsSettings.create(:location_id => locatable.id ,:radius => 0)
    @neighbors_settings = locatable.neighbors_settings
    neighbors = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id).map { |neighbor| neighbor.location_id}
    @locatables = Spree::Location.where(locatable_type: 'Spree::Product').where.not(locatable_id: @product.id).where.not(id: neighbors).map { |location| [location.locatable.name, location.id]}
    @neighbors_locatables = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id).map { |neighbor| [Spree::Location.find(neighbor.location_id).locatable.name, neighbor.location_id, neighbor]}
    @properties = Spree::Property.all.map{|property| [property.name, property.id]}
  end
end


