LostTribes3::Application.routes.draw do
  get "store/index"
  root to: 'store#index'

  devise_for :users
  
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
  end

  resources :line_items do
    collection do
      get :subtract
    end
  end




end
