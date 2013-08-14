CONFIG = :snc
###########################################################################
case CONFIG
when :pqr
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_DEVISE_PATH = 'file:///home/pqr/work/jaf/spree'
  SPREE_LOCATION_PATH = 'file:///home/pqr/work/jaf/openjaf'
when :snc
  GEMS_PATH = 'file:///home/test/.rvm/gems/ruby-1.9.3-p392/bundler/gems/'
  SPREE_DEVISE_PATH = 'file:///media/Data/jaf/spree'
  SPREE_LOCATION_PATH = 'file:///media/Data/jaf/spree_travel'
when :raul
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_DEVISE_PATH = 'file:///home/raul/RubymineProjects/spree'  
  SPREE_LOCATION_PATH = 'file:///home/raul/RubymineProjects/openjaf'
else
  GEMS_PATH = 'http://rubygems.org'
  SPREE_DEVISE_PATH = 'https://github.com/radar'
  SPREE_LOCATION_PATH = 'https://github.com/openjaf'
end
########################################################################

source GEMS_PATH

gem 'spree_auth_devise', 	:git => "#{SPREE_DEVISE_PATH}/spree_auth_devise", :branch => '2-0-stable'
gem 'spree_location', 	    :git => "#{SPREE_LOCATION_PATH}/spree_location"

gemspec

