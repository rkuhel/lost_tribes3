require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { city: @event.city, creator_id: @event.creator_id, description: @event.description, end_date: @event.end_date, end_time: @event.end_time, image_url: @event.image_url, price: @event.price, start_date: @event.start_date, start_time: @event.start_time, state: @event.state, street2: @event.street2, street: @event.street, title: @event.title, zip: @event.zip }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { city: @event.city, creator_id: @event.creator_id, description: @event.description, end_date: @event.end_date, end_time: @event.end_time, image_url: @event.image_url, price: @event.price, start_date: @event.start_date, start_time: @event.start_time, state: @event.state, street2: @event.street2, street: @event.street, title: @event.title, zip: @event.zip }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
