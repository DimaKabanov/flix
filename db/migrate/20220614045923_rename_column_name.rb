class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :relased_on, :released_on
  end
end
