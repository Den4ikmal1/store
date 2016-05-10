class AddColumnToCitiesMidrange < ActiveRecord::Migration
  def change
    add_column :cities, :cities_midrange, :text, array: true, default: []
  end
end
