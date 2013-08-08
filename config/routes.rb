LostTribes3::Application.routes.draw do
  get "home/index"
  get "store/index"

  match '/' => 'home#index', :via => :get

  devise_for :users

  resources :users
  resources :carts
  resources :charges
  resources :beers

  resources :events do
    member do
      post :register
      patch :remove_event, as: 'remove'
    end
  end

  resources :carts do
    scope :orders do
      collection do 
        get :ticket
        get :shipping
        get :billing
      end
    end
    member do 
      post :mark_shipped
    end
  end

  resources :line_items, except: [:update] do
    member do
      patch :add
      patch :subtract
    end
  end
end
