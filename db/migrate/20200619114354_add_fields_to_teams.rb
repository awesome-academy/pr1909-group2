class AddFieldsToTeams < ActiveRecord::Migration[6.0]
  def change
  	add_column :teams, :logo, :string
  end
end
