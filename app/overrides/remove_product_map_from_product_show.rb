Deface::Override.new(
  :virtual_path => "spree/products/show",
  :name => "remove_product_map_from_product_show",
  :remove => "[data-hook='product_map']",
  :disabled => false
)