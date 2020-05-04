class AddDeleteAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :delete_at, :datetime
    add_index :users, :delete_at
  end
end
