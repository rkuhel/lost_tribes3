class UsersController < ApplicationController
  load_and_authorize_resource

  def index
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
    # authorize! :read, User, :user_id => @user.id
  end

  def edit
    # if params[:id] == current_user.id
      @user = User.find(params[:id])
      # authorize! :edit, User, :user_id => current_user.id
    # else
      # render text: "Sorry, You are not authorized to view this page."
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params['user'])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
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
