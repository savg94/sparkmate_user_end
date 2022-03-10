class AddActiveGigCountToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :active_gigs_count, :integer
  end
end
