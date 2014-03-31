Spree::ProductsHelper.module_eval do
  def get_name_from_locatable(item)
    location_item = Spree::Location.find_by_id(item)
    location_item.locatable.name
  end
end