FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_neighbors/factories'
  factory Spree::NeighborsSettings do |l|
    l.radius 50
    l.count 10
    l.sort 1
  end
end
