class AddRequestReferenceToAddOnServices < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :add_on_services, :requests
    add_index :add_on_services, :request_id
    change_column_null :add_on_services, :request_id, false
  end
end
