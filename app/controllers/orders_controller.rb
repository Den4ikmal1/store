class OrdersController < ApplicationController
  before_action :current_cart, only: [:create, :new]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :destroy]

  respond_to :html

  def new
    if @cart.line_items.empty?
      redirect_to root_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items(@cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderNotifier.received(@order).deliver_now
      redirect_to root_url, notice: 'Thank you for your order.' 
    else 
      @cart = current_cart
      render :new
    end
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    respond_with(@order.destroy)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :phone)
    end
end
