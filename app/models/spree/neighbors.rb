class Spree::Neighbors < ActiveRecord::Base
  belongs_to :location, class_name: "Spree::Location"
  belongs_to :neighbors_setting, class_name: "Spree::NeighborsSettings"
end
