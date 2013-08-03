class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # def new
  # end

  # def create
  # end

  def show
    @user = User.find(params[:id])
  end

  # def edit
  # end

  # def create
  # end

  # def destroy
  # end

end