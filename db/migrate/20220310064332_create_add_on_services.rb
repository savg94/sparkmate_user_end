class CreateAddOnServices < ActiveRecord::Migration[6.0]
  def change
    create_table :add_on_services do |t|
      t.boolean :fast_charge
      t.boolean :regular_charge
      t.boolean :interior_cleaning
      t.boolean :exterior_cleaning
      t.boolean :daily_checks
      t.boolean :scheduled_maintenance
      t.datetime :maintenance_datetime
      t.string :maintenance_location
      t.integer :request_id

      t.timestamps
    end
  end
end
