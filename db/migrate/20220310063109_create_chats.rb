class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :provider_id
      t.string :message
      t.integer :gig_id

      t.timestamps
    end
  end
end
