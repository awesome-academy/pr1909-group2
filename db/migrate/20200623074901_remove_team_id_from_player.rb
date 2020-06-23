class RemoveTeamIdFromPlayer < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :team_id, :integer
  end
end
