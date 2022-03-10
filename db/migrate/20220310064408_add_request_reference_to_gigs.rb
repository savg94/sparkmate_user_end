class AddRequestReferenceToGigs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gigs, :requests
    add_index :gigs, :request_id
    change_column_null :gigs, :request_id, false
  end
end
