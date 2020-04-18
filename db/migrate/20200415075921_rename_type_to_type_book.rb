class RenameTypeToTypeBook < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :type, :type_book
  end
end
