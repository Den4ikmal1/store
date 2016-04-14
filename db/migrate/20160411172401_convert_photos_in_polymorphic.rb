class ConvertPhotosInPolymorphic < ActiveRecord::Migration
  def change
    remove_index :photos, :product_id
    rename_column :photos, :product_id, :photoable_id
    
    add_column :photos, :photoable_type, :string

    add_index :photos, [:photoable_id, :photoable_type]
    
  end
end
