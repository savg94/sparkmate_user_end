class AddMaintenanceLocationLatitudeToAddOnService < ActiveRecord::Migration[6.0]
  def change
    add_column :add_on_services, :maintenance_location_latitude, :float
  end
end
