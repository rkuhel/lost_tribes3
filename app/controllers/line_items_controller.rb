class LineItemsController < ApplicationController
  include CurrentCart
  # before_action :set_cart, only: [:create]

  before_action :set_line_item, only: [:show, :edit, :destroy, :add, :subtract]
  before_filter :authenticate_user!, [:create, :edit, :destroy, :add, :subtract]



  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    @cart = current_user.current_cart
    if params[:beer_id]
      existing_line_item = @cart.line_items.find_by_beer_id(params[:beer_id])
      if existing_line_item
        @cart.increment_item(existing_line_item)
      else
        @cart.line_items << LineItem.new(beer_id: params[:beer_id])
      end
    elsif params[:event_id]
      existing_line_item = @cart.line_items.find_by_event_id(params[:event_id])
      if existing_line_item
        @cart.increment_item(existing_line_item)
      else
        @cart.line_items << LineItem.new(event_id: params[:event_id])
      end
    end
    redirect_to :back
  end

  def add
     current_user.current_cart.increment_item(@line_item)
     redirect_to :back
  end

  def subtract
    current_user.current_cart.decrement_item(@line_item)
    redirect_to :back
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

end