class CreateAuthorBookPublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :author_book_publishers do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
    add_index :author_book_publishers, :author_id
    add_index :author_book_publishers, :book_id
    add_index :author_book_publishers, :publisher_id
  end
end
