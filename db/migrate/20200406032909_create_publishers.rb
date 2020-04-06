class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
