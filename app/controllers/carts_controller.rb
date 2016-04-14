class CartsController < ApplicationController
  
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  respond_to :js


  def show
    respond_with(@cart)
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    respond_with(@cart = Cart.create(cart_params))
  end

  def update
    @cart.update(cart_params)
    respond_with(@cart)
  end

  def destroy
    @cart.destroy
    redirect_to root_url
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end
end