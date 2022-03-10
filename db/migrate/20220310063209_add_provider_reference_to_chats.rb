class AddProviderReferenceToChats < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :chats, :providers
    add_index :chats, :provider_id
    change_column_null :chats, :provider_id, false
  end
end
