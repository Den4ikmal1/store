class RemoveColumnToCities < ActiveRecord::Migration
  def change
    remove_column :cities, :description
    remove_column :cities, :cities_midrange
  end
end
