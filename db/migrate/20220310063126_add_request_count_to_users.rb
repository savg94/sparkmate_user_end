class AddRequestCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :requests_count, :integer
  end
end
