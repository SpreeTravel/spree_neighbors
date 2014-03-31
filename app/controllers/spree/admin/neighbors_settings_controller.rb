module Spree
  module Admin
    class NeighborsSettingsController < Spree::Admin::BaseController
      def edit
        @collection = Spree::Location.all
      end
      def update
        # respond_to do |format|
        #   format.js { head :ok }
        # end
        raise "Pill"
        redirect_to :back
      end
    end
  end
end