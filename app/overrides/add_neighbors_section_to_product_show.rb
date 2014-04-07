Deface::Override.new(
  :virtual_path => "spree/products/show",
  :name => "add_neighbors_section_to_product_show",
  # :remove => "[data-hook='product_map']",
  :insert_after => '[data-hook="product_left_part_wrap"]',
  # :insert_after => "[data-hook='product_map']",
  :partial => "spree/admin/products/neighbors_map",
  :disabled => false
)