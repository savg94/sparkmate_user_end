class AddPickupLocationLongitudeToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :pickup_location_longitude, :float
  end
end
