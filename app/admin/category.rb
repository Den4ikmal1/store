ActiveAdmin.register Category do
  permit_params :name
  index do   
    column :name
    column :created_at
    column :updated_at
    actions dropdown: true 
  end

end
