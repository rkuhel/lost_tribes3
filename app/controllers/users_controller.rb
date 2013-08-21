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
      render "devise/registrations#create"
    end
  end

  def show
  end

  def edit
  end

  def update
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
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:role, :name, :email, :zip_code, :phone, 
        :street_address1, :street_address2, :city, :state, :admin, :password, 
        :password_confirmation)
    end
end
