class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource only: [:remove_event, :register]
  before_filter :authenticate_user!, only: [:register]

  def index
    @events = Event.all.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

  def register
    event = Event.find(params[:id])
    current_user.events.push(event) unless event.in?(current_user.events)
    if event.price == 0 || event.price = nil
      redirect_to user_path(current_user), notice: "You've successfully registered for #{event.title}"
    else
      this_event = current_user.current_cart.line_items.find_by_event_id(event.id)
      if this_event
        this_event.quantity += 1
        this_event.save!
      else
        LineItem.create(event_id: event.id, cart_id: current_user.current_cart.id, quantity: 1, event_id: event.id)
      end
      redirect_to cart_path(current_user.current_cart)
    end
  end

  def remove_event
    event = Event.find(params[:id])
    current_user.events.delete(event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :image_url, :street, :street2, :city, :state, :zip, :start_date, :start_time, :end_date, :end_time, :creator_id, :price)
    end
end
