class CreateSpreeNeighbors < ActiveRecord::Migration
  def change
    create_table :spree_neighbors do |t|
      t.references :neighbors_settings
      t.references :location
      t.timestamps
    end
  end
end
