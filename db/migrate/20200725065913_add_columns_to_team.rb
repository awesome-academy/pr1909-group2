class AddColumnsToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :point, :integer, default: 0
    add_column :teams, :w, :integer, default: 0
    add_column :teams, :l, :integer, default: 0
    add_column :teams, :p, :integer, default: 0
    add_column :teams, :d, :integer, default: 0
    add_column :teams, :goals, :integer, default: 0
  end
end
