class CategoriesController < ApplicationController

  before_action :find_categoty, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  authorize_resource
  
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path 
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    respond_with(@category)do |format|
      format.html { redirect_to categories_path }
    end
  end

  def destroy
   respond_with(@category.destroy) do |format|
      format.html { redirect_to categories_path }
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
    def find_categoty
      @category = Category.find(params[:id])
    end
end
