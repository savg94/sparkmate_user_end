class AddChatCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :chats_count, :integer
  end
end
