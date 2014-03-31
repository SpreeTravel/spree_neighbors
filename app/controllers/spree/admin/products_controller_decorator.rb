Spree::Admin::ProductsController.class_eval do
  def neighbors
    locatable = @product.location
    locatable.neighbors_settings = locatable.neighbors_settings || Spree::NeighborsSettings.create(:location_id => locatable.id ,:radius => 0)
    @neighbors_settings = locatable.neighbors_settings
    @locatables = Spree::Location.where(locatable_type: 'Spree::Product').where.not(locatable_id: @product.id).map { |location| [location.locatable.name, location.id]}
    @properties = Spree::Property.all.map{|property| [property.name, property.id]}
  end
end


