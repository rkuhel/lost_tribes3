class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @beers = Beer.all
  end

  def show
  end

  def new
    @beer = Beer.new
    authorize! :create, Beer
  end

  def edit
    authorize! :edit, Beer
  end

  def create
    @beer = Beer.new(beer_params)
    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beer }
      else
        format.html { render action: 'new' }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, Beer
    if @beer.destroy
      respond_to do |format|
        format.html { redirect_to beers_url, notice: "Beer successfully deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to beers_url, alert: "Beer could not be deleted. Check for line item dependencies." }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:title, :description, :image_url, :price)
    end
end
