class AddColumnToSities < ActiveRecord::Migration
  def change
    add_column :cities, :address_to, :string
  end
end
