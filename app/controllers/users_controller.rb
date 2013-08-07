class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: [:remove_event, :shipping, :billing]

  before_filter :valid_shipping, only: [:billing]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # UserMailer.signup_confirmation(@user).deliver
      redirect_to store_index_path, notice: "Signed up successfully."
    else
      render "devise/registrations#create"
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])

  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in(current_user, :bypass => true)
      flash[:notice] = "Account Updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # render json: @user
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def shipping
    @user = current_user
    # if @user.update!
    #   render shipping_users_path(params[:user])
    # end
  end 

  def billing
    @user = current_user
  end

  def ticket
    # ticket_users
    @carts = Cart.all
    @orders = @carts.where(current: false)
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:role, :name, :email, :zip_code, :phone, 
      :street_address1, :street_address2, :city, :state, :admin, :password, 
      :password_confirmation)
  end
  def valid_shipping
    unless ( current_user.has_valid_shipping )
      flash[:notice] = "Please fill out all fields to complete order"
      redirect_to shipping_users_path 
    end 
  end 
end
