module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = current_user.current_cart
    end
    #   @cart = Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    # end
end
