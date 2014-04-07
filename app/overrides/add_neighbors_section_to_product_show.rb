Deface::Override.new(
  :virtual_path => "spree/admin/products/_form",
  :name => "add_location_to_admin_product_form",
  :insert_top => '[data-hook="product_map"]',
  :partial => "spree/admin/products/neighbors_map",
  :disabled => false
)