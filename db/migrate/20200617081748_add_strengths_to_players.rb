class AddStrengthsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :strengths, :string
  end
end
