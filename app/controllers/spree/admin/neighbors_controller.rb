module Spree
  module Admin
    class NeighborsController < Spree::Admin::BaseController

      def destroy
        @neighbor = Spree::Neighbors.find(params[:id])
        if(@neighbor.destroy)
          respond_with(@object) do |format|
            format.html { redirect_to :back }
            format.js   { render :partial => "spree/admin/shared/destroy" }
          end
        else
          flash[:error] = t(:fail_remove_neighbor)
          redirect_to :back
        end
      end

    end
  end
end