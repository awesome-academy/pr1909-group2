class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id
      t.integer :away_team_id

      t.timestamps
    end
  end
end
