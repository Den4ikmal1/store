class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.integer :phone

      t.timestamps null: false
    end
  end
end
