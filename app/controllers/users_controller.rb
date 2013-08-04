class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  # def destroy
  # end


private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :name, :email, :zip_code, :phone, :street_address1, :street_address2, :city, :state, :admin, :password)
    end

end