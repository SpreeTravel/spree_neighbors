class AddSortingFieldToNeighborsSettings < ActiveRecord::Migration
  def change
    add_column :spree_neighbors_settings, :sort, :integer
  end
end
