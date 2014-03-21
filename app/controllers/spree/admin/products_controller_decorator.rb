Spree::Admin::ProductsController.class_eval do
  def neighbors
    @locatable = @product.location
  end
end
