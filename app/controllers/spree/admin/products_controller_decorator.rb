Spree::Admin::ProductsController.class_eval do

  def neighbors
    locatable = @product.location
    default_options = {:location_id => locatable.id ,:radius => 0, :count => 0, :sort => 1}
    default_neighbors_settins = Spree::NeighborsSettings.create(default_options)
    @neighbors_settings = locatable.neighbors_settings = locatable.neighbors_settings || default_neighbors_settings
    neighbor_location_ids = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id).pluck(:location_id)
    locatables = Spree::Location.where(locatable_type: 'Spree::Product')
    locatables = locatables.where.not(locatable_id: @product.id)
    locatables = locatables.where.not(id: neighbor_location_ids)
    locatables = locatables.find_all {|l| l.locatable }
    @locatables = locatables.map { |location| [location.locatable.name, location.id]}
    neighbors_locatables = Spree::Neighbors.where(neighbors_settings_id: @neighbors_settings.id)
    neighbors_locatables = neighbors_locatables.includes([{:location => {:locatable => :translations}}])
    @neighbors_locatables = neighbors_locatables.map { |neighbor| [neighbor.location.locatable.name, neighbor.location_id, neighbor]}
    @properties = Spree::Property.all.map{|property| [property.name, property.id]}
    @sorting_options = [['By Distance', 1], ['By Name', 2]]
    @sorting_selected = @neighbors_settings.sort
    @property_selected = @neighbors_settings.neighbors_by_property.nil? ? -1 : @neighbors_settings.neighbors_by_property.property_id
    @property_selected_value = @neighbors_settings.neighbors_by_property.nil? ? "" : @neighbors_settings.neighbors_by_property.value
  end
end


