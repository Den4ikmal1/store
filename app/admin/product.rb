ActiveAdmin.register Product do

  index do
    column :title
    column :description, sortable: false
    column :price
    column :created_at
    column :category
    actions do |product|
      link_to "View product", product_path(product), class: "member_link"
    end
  end

  filter :category
  filter :title
  filter :price

end
