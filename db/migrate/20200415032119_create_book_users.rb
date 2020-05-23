class CreateBookUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :book_users, :user_id, name: 'speeduser'
    add_index :book_users, :book_id, name: 'speedbook'
  end
  add_index :book_users, :user_id, name: 'speeduser'
  add_index :book_users, :user_id, name: 'speedbook'
end
