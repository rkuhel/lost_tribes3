class ChargesController < ApplicationController
  # should be unnecessary
  # def new
  # end

  def create
    # current_user.current_cart.current = false 
    # current_user.save!

    old_cart_id = current_user.current_cart.id
    old_cart = current_user.carts.find(old_cart_id)
    old_cart.current = false
    old_cart.save! 


    #email is .delivered to user and admin
    # OrderNotifier.order_confirmation(current_user).deliver 

    #
    current_user.carts.push(Cart.new)

    # Amount in cents
    @decimal_amount = old_cart.total_up_cart
    @amount = (@decimal_amount * 100).to_i
    # @current_user.current_cart.line_items.beer.price

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken] #got this from the charges controller
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Lost Tribes customer',
      :currency    => 'usd'
    )

    flash[:notice] = "Your order was successfully processed. Thank you for your purchase!"
    redirect_to user_path(current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
