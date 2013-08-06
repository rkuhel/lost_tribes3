LostTribes3::Application.routes.draw do

  root to: 'store#index'

  devise_for :users

  resources :line_items
  resources :carts
  resources :charges
  resources :beers

  resources :events do
    member do
      post :register
    end
  end

  resources :users do
    collection do
      get :shipping
      get :billing
    end
  end

  get "store/index"
  patch 'remove_event/:id' => 'users#remove_event', as: 'remove_event'

end
