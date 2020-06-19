class RemoveImageFromTeam < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :image, :string
  end
end
