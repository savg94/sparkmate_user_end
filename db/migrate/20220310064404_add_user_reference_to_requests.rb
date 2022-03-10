class AddUserReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests, :users
    add_index :requests, :user_id
    change_column_null :requests, :user_id, false
  end
end
