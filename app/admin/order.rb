ActiveAdmin.register Order do

  index do
    column :id
    column :name
    column :address
    column :phone, sortable: false
    column :created_at
    actions dropdown: true 
  end

  filter :name
  filter :address
  filter :created_at
end
