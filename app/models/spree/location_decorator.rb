Spree::Location.class_eval do
  has_one :neighbor_settings, class_name: "Spree::NeighborsSettings"
  accepts_nested_attributes_for :neighbor_settings, :allow_destroy => true
end