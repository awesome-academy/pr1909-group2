class AddWeaknessesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :weaknesses, :string
  end
end
