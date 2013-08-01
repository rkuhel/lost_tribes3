class StoreController < ApplicationController
  def index
  	# @beers = Beer.order(:title)
    @beers = Beer.all
  end
end
