class AddDropoffLocationLongitudeToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :dropoff_location_longitude, :float
  end
end
