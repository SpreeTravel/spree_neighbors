module Spree
  module Admin
    class NeighborsSettingsController < Spree::Admin::BaseController
      def edit
        @collection = Spree::Location.all     
      end
    end
  end
end