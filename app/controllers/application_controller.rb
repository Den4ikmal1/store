require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

 
  protect_from_forgery with: :exception
  helper_method :current_cart

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '5.149.208.0'
    else
      request.remote_ip
    end
  end

  def authenticate_active_admin_user!
   authenticate_user!
   unless current_user.role?(:admin)
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
   end
  end
  def current_cart 
    @cart ||= Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
