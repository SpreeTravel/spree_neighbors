module Spree
  module Admin
    module NeighborsSettingsHelper
      def get_name_from_locatable(item)
        item.locatable.name
      end
    end
  end
end