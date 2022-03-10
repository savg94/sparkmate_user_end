class AddDropoffLocationFormattedAddressToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :dropoff_location_formatted_address, :string
  end
end
