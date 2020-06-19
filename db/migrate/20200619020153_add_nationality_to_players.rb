class AddNationalityToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :nationality, :string
  end
end
