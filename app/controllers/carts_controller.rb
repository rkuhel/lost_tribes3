class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource only: [:shipping, :billing]
  before_filter :valid_shipping, only: [:billing]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end
  
  def shipping
    @user = current_user
  end

  def billing
    @user = current_user
  end

  def ticket
    @carts = Cart.all
    @orders = Cart.all.where(current: false).order("shipped ASC").page(params[:page]).per(5)
  end

  def mark_shipped
    @orders = Cart.all
    @order = @orders.find(params[:id] )
    puts "this is the order " + @order.to_s
    puts "was the order shipped? " + @order.shipped.to_s
    @order.shipped = true
    puts "order was shipped? " + @order.shipped.to_s
    @order.save!
    render :json => @order.to_json
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end

    def valid_shipping
      unless ( current_user.has_valid_shipping )
        flash[:notice] = "Please fill out all fields to complete order"
        redirect_to shipping_carts_path
      end
    end
end
