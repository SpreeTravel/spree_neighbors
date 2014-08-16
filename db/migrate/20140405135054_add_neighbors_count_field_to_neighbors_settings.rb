class AddNeighborsCountFieldToNeighborsSettings < ActiveRecord::Migration
  def change
    add_column :spree_neighbors_settings, :count, :integer
  end
end
