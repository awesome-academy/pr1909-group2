class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :nationality
      t.float :height
      t.float :weight
      t.integer :shirt_number
      t.integer :preferred_foot

      t.timestamps
    end
  end
end
