class UsersController < ApplicationController
  load_and_authorize_resource

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
      render :new
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
      sign_in(@user, :bypass => true)
      flash[:notice] = "Account Updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # redirect_to root_path 

    # render json: @user
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to root_path
    end

    
    # end
  end

  def remove_event
    event = Event.find(params[:id])
    current_user.events.delete(event)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:role, :name, :email, :zip_code, :phone, 
      :street_address1, :street_address2, :city, :state, :admin, :password, 
      :password_confirmation)
  end

end
