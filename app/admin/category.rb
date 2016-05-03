ActiveAdmin.register Category do
  permit_params :name, :parent_id
  sortable_tree_member_actions

  
  index do   
    column :name 
    column :created_at
    column :updated_at
    actions dropdown: true 
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :parent_id, :as => :select, :collection => nested_set_options(Category, @category) {|i| "#{'-' * i.level} #{i.name}" },  :input_html => { :class => 'select2'}

    end
    f.button :create
    
  end

 

end
