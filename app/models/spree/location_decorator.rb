Spree::Location.class_eval do
  has_one :neighbors_settings, class_name: "Spree::NeighborsSettings"
  accepts_nested_attributes_for :neighbors_settings, :allow_destroy => true
  #Fields for the geocoder gem
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end