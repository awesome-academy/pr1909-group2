class AddColumnsToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :score_home, :integer
    add_column :matches, :score_away, :integer
    add_column :matches, :start_match, :datetime
    add_column :matches, :end_match, :datetime
    add_column :matches, :status, :integer
  end
end
