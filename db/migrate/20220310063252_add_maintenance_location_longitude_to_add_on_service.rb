class AddMaintenanceLocationLongitudeToAddOnService < ActiveRecord::Migration[6.0]
  def change
    add_column :add_on_services, :maintenance_location_longitude, :float
  end
end
