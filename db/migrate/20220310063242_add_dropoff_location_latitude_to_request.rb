class AddDropoffLocationLatitudeToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :dropoff_location_latitude, :float
  end
end
