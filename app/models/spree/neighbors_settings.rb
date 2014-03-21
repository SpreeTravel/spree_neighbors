class Spree::NeighborsSettings < ActiveRecord::Base
  belongs_to :location, class_name: "Spree::Location"
  validates :radius, :numericality => { :greater_than => 0 }
end
