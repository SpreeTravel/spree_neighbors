require 'spec_helper'

describe Spree::Neighbors do
  it 'creates its associations correctly' do
    neighb_set = FactoryGirl.create(Spree::NeighborsSettings)
    loc = FactoryGirl.create(Spree::Location)
    loc2 = FactoryGirl.create(Spree::Location, :latitude => 23.139, :longitude => -82.58)
    neighb_set.location = loc
    l = Spree::Neighbors.create()
    l.neighbors_setting = neighb_set
    l.location = loc2
    l.neighbors_setting.location.latitude.should be_equal(23.129)
    l.neighbors_setting.location.longitude.should be_equal(-82.38)
  end
end