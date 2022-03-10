class AddChatCountToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :chats_count, :integer
  end
end
