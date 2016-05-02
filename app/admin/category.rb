ActiveAdmin.register Category do

  index do   
    selectable_column
    column :name
    column :created_at
    column :updated_at
    actions dropdown: true 
  end

end
