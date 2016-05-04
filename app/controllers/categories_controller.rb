class CategoriesController < ApplicationController

  before_action :find_categoty, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  before_action :categories_load, only: [:new, :create, :edit, :update]

  include TheSortableTreeController::Rebuild

  def show
    
  end

  
  def index
    clieint_ip = remote_ip
    @country_name = User.found_country(clieint_ip)
    @categories = Category.nested_set.all
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

  def show
   
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
    def categories_load
      @categories = Category.find_each.map{ |c| [c.name, c.parent_id]}
    end
end
