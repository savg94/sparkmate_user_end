class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.integer :request_id
      t.integer :provider_id
      t.string :status

      t.timestamps
    end
  end
end
