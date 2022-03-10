class AddPickupLocationFormattedAddressToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :pickup_location_formatted_address, :string
  end
end
