LostTribes3::Application.routes.draw do

  devise_for :users
  resources :users

  resources :line_items

  resources :carts

  resources :events do
    member do
      post :register
      patch :remove_event, as: 'remove'
    end
  end

  resources :charges

  get "store/index"
  resources :beers
  root to: 'store#index' #, as: 'store'

  # patch 'remove_event/:id' => 'users#remove_event', as: 'remove_event'

end
