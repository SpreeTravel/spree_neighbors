class Spree::NeighborsSettings < ActiveRecord::Base
  belongs_to :location, class_name: "Spree::Location"
  validates :radius, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count, :numericality => { :greater_than_or_equal_to => 0, only_integer: true }
  validates :sort, :numericality => { :greater_than_or_equal_to => 0, only_integer: true }
  has_many :neighbors, class_name: "Spree::Neighbors"
  has_one :neighbors_by_property, class_name: "Spree::NeighborsByProperty"

  def self.create_settings_for(location)
    s = Spree::NeighborsSettings.new
    s.location_id = location.id
    s.radius = 10
    s.count = 10
    s.sort = 1
    s.save
  end
end
