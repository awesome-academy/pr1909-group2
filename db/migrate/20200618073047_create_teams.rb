class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.string :image

      t.timestamps
    end
  end
end
