class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @decimal_amount = current_user.current_cart.total_up_cart
    @amount = (@decimal_amount * 100).to_i
    # @current_user.current_cart.line_items.beer.price

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Lost Tribes customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
