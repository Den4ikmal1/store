class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :description


      t.timestamps null: false
    end
  end
end
