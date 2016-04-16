class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :categories_load, only: [:new, :edit, :create, :update]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  
  respond_to :html, :js

  authorize_resource

  def index
    if params[:category].blank?
      @search = Product.ransack(params[:q])
      search_products(@search)
    else  
      @category_id = Category.find_by(name: params[:category]).id
      @search = Product.where(category_id: @category_id).ransack(params[:q])
      search_products(@search)
    end
    respond_with(@products)   
  end

  def show
    @reviews = @product.reviews.paginate(page: params[:page], per_page: 4)
    @average_review = @product.average_review(@reviews)
    respond_with(@product)  
  end

  def edit
   
  end

  def update
    @product.category_id = params[:category_id]
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to root_url
    else
      render :new
    end
  end


  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id, photos_attributes: [:file])
    end
    def find_product
      @product = Product.find(params[:id])
    end
    def categories_load
      @categories = Category.find_each.map{ |c| [c.name, c.id]}
    end

    def search_products(search)
      @products = search.result.paginate(page: params[:page], per_page: 8).includes(:photos)
    end
 

end
