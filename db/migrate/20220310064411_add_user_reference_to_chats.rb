class AddUserReferenceToChats < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :chats, :users
    add_index :chats, :user_id
    change_column_null :chats, :user_id, false
  end
end
