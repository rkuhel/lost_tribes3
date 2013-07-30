class StoreController < ApplicationController
  def index
  	@beers = Beer.order(:title)
  end
end
