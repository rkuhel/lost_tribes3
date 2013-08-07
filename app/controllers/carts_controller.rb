class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource only: [:shipping, :billing]

  before_filter :valid_shipping, only: [:billing]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    # user = current_user
    # @cart = Cart.find(params[:id])
    # @beer = Beer.find(params[:id])
  end

  # GET /carts/new
  def new
    # @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
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

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
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

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end
  
  def shipping
    @user = current_user
    # if @user.update!
    #   render shipping_carts_path(params[:user])
    # end
  end

  def billing
    @user = current_user
  end

  def ticket
    # ticket_carts
    @carts = Cart.all
    @orders = Cart.all.where(current: false)
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
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params[:cart]
    # params.require[:cart].permit(:current, :user_id)
  end

  def valid_shipping
    unless ( current_user.has_valid_shipping )
      flash[:notice] = "Please fill out all fields to complete order"
      redirect_to shipping_carts_path
    end
  end
end
