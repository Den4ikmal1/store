ActiveAdmin.register Product do
  permit_params :title, :price
  scope :expensive_price
  scope :all
  index do
    column :title do |product|
      link_to product.title, admin_product_path(product), class: "member_link"
    end
    column :description, sortable: false
    column :price
    column :created_at
    column :category, sortable: :category_id
    actions dropdown: true  
  end

  filter :category
  filter :title
  filter :price

  controller do
    def scoped_collection
      Product.includes(:category)
    end
  end

end
