class Spree::NeighborsByProperty < ActiveRecord::Base
  belongs_to :property, class_name: "Spree::Property"
  belongs_to :neighbors_setting, class_name: "Spree::NeighborsSettings"
  validates_presence_of :value
end
