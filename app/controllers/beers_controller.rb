class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
  end

  # GET /beers/new
  def new
    @beer = Beer.new
    authorize! :create, Beer
  end

  # GET /beers/1/edit
  def edit
    authorize! :edit, Beer
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beer }
      else
        format.html { render action: 'new' }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
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

  # DELETE /beers/1
  # DELETE /beers/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:title, :description, :image_url, :price)
    end
end
