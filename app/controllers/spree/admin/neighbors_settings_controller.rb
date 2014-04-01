module Spree
  module Admin
    class NeighborsSettingsController < Spree::Admin::BaseController
      def edit
        @collection = Spree::Location.all
      end
      def update
        radius = params[:radius_active] == '1' ? (Integer(params[:radius]) > 0 ? Integer(params[:radius]) : 0) : 0

        raise "Pill"
        redirect_to :back
      end
    end
  end
end