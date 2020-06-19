class AddAgeToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :age, :integer
  end
end
