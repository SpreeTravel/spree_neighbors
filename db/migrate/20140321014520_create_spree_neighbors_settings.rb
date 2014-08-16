class CreateSpreeNeighborsSettings < ActiveRecord::Migration
  def change
    create_table :spree_neighbors_settings do |t|
      t.references :location
      t.float :radius
      t.timestamps
    end
  end
end
