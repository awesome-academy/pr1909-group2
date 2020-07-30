class AddTournamentIdToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :tournament_id, :integer
    add_index :matches, :tournament_id
  end
end
