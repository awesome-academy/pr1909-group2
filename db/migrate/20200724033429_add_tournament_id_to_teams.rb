class AddTournamentIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :tournament_id, :integer
    add_index :teams, :tournament_id
  end
end
