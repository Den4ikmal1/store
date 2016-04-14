class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.integer :product_id, index: true
      t.timestamps null: false
    end
  end
end
