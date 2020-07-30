class AddValueMoneyToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :value_money, :integer
  end
end
