class AddDiagramToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :diagram, :string
  end
end
