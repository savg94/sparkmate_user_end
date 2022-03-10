class AddMaintenanceLocationFormattedAddressToAddOnService < ActiveRecord::Migration[6.0]
  def change
    add_column :add_on_services, :maintenance_location_formatted_address,
               :string
  end
end
