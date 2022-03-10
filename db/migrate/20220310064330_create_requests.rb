class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :pickup_datetime
      t.string :pickup_location
      t.datetime :dropoff_datetime
      t.string :dropoff_location
      t.integer :user_id

      t.timestamps
    end
  end
end
