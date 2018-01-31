class ChangeUserColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :username, :nickname
  end
end
