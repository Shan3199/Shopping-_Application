class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :current_cart

  private
    def current_cart
      # debugger
      if session[:cart_id]
        # debugger
        cart = Cart.find_by(:id => session[:cart_id])
        # debugger
        if cart.present?
          # debugger
          @current_cart = cart
          # debugger
        else
           # debugger
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
end
