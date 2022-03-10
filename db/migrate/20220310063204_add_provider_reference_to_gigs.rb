class AddProviderReferenceToGigs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gigs, :providers
    add_index :gigs, :provider_id
    change_column_null :gigs, :provider_id, false
  end
end
