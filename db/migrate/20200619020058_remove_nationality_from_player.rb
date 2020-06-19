class RemoveNationalityFromPlayer < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :nationality, :integer
  end
end
