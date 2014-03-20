Deface::Override.new(
  :virtual_path => "spree/admin/shared/_product_tabs",
  :name => "add_product_neighbors_link",
  :insert_bottom => "[data-hook='admin_product_tabs']",
  :partial => "spree/admin/products/neighbors_link",
  :disabled => false)
