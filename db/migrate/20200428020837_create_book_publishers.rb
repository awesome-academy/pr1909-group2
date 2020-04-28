class CreateBookPublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_publishers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
