class CreateAuthorPublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :author_publishers do |t|
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
