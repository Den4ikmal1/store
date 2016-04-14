class ReviewsController < ApplicationController
  before_action :find_product
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html, :js
  
  authorize_resource

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params.merge(user: current_user, product: @product))
    respond_with(@review) do |format|
      format.html { redirect_to @product }
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    respond_with(@review) do |format|
      format.html { redirect_to @product }
    end  
  end

  def destroy
    respond_with(@review.destroy)
  end
    
 

  private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_product
      @product = Product.find(params[:product_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
