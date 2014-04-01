class Spree::NeighborsSettings < ActiveRecord::Base
  belongs_to :location, class_name: "Spree::Location"
  validates :radius, :numericality => { :greater_or_equal_than => 0 }
  has_many :neighbors, class_name: "Spree::Neighbors"
  has_one :neighbors_by_property, class_name: "Spree::NeighborsByProperty"
end
