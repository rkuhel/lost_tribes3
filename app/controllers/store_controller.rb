class StoreController < ApplicationController
  def index
    @beers = Beer.all
  end
end
