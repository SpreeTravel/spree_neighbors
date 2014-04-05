module Spree
  module Admin
    class NeighborsController < Spree::Admin::BaseController

      def destroy
        @neighbor = Spree::Neighbors.find(params[:id])
        if(@neighbor.destroy)
          flash[:success] = t(:successfully_removed_neighbor)
          respond_to do |format|
            format.js { render :partial => "spree/admin/shared/destroy" }
          end
        else
          flash[:error] = t(:fail_remove_neighbor)
          redirect_to :back
        end
      end

      def create
        if (Spree::Neighbors.create(:neighbors_settings_id => params[:neighbors_settings_id], :location_id => params[:neighbor_product]))
          flash[:success] = t(:successfully_added_neighbor)
          respond_to do |format|
            format.js
          end
        else
          flash[:error] = t(:fail_add_neighbor)
        end
      end
    end
  end
end