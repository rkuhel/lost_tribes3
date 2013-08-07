LostTribes3::Application.routes.draw do
  get "store/index"
  root to: 'store#index'

  devise_for :users
  resources :line_items
  resources :carts
  resources :charges
  resources :beers

  resources :events do
    member do
      post :register
      patch :remove_event, as: 'remove'
    end
  end

  resources :users do
    collection do
      get :shipping
      get :billing
    end
    member do 
      get :ticket
    end
  end


end
