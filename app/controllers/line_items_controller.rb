class LineItemsController < ApplicationController
  
  before_action :current_cart, only: [:create]
  before_action :set_line_item,  only: [:destroy, :edit, :update]

  def new
    @line_item = LineItem.new
  end

  
  def edit
  end


  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to @line_item.cart 
    else
        render action: 'new'  
    end
  end


  def update
    @line_item.update(line_item_params)
    respond_with(@review) do |format|
      format.html { redirect_to @line_item.cart }
    end
  end

  def destroy
    respond_with(@line_item.destroy) do |format|
      format.html { redirect_to @line_item.cart }
    end
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

   
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity)
    end
end