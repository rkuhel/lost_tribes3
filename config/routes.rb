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
    member do 
      get :ticket
    end
  end

  resources :line_items, except: [:update] do
    member do
      patch :add
      patch :subtract
    end
  end




end
