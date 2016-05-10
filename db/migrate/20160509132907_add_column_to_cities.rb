class AddColumnToCities < ActiveRecord::Migration
  def change
    add_column :cities, :cities_name, :text, array: true, default: []
  end
end
