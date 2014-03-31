Spree::Location.class_eval do
  has_one :neighbors_settings, class_name: "Spree::NeighborsSettings"
  accepts_nested_attributes_for :neighbors_settings, :allow_destroy => true
end