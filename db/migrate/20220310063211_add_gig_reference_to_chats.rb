class AddGigReferenceToChats < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :chats, :gigs
    add_index :chats, :gig_id
    change_column_null :chats, :gig_id, false
  end
end
