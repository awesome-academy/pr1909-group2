class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :book_id
      t.integer :cart_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
