ActiveAdmin.register Product do
  permit_params :title, :price, :description, :category_id, :photos
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

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :price
      f.input :category
    end
    f.has_many :photos do |s|
        s.input :file, :as => :file
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit :utf8, :authenticity_token, :commit, product: [:title, :description, :price, :category_id, photos_attributes: [:file]]
    end
  end
   

  controller do
    def scoped_collection
      Product.includes(:category)
    end
  end

end
