class AddColumnToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :role, :string
  end
end
