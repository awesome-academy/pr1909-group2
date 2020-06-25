class AddPointToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :point, :float
  end
end
