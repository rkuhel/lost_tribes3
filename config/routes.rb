LostTribes3::Application.routes.draw do
  get "store/index"
  root to: 'store#index'

  devise_for :users
  resources :line_items
  resources :users

  resources :carts do 
    collection do 
      get :ticket
      get :shipping
      get :billing
    end
    member do 
      post :mark_shipped
    end
  end

  resources :charges
  resources :beers

  resources :events do
    member do
      post :register
      patch :remove_event, as: 'remove'
    end
  end
end
