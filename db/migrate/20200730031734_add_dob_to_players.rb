class AddDobToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :dob, :date
  end
end
