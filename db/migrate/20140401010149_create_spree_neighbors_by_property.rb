class CreateSpreeNeighborsByProperty < ActiveRecord::Migration
  def change
    create_table :spree_neighbors_by_properties do |t|
      t.references :neighbors_settings
      t.references :property
      t.string :value
      t.timestamps
    end
  end
end
