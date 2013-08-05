LostTribes3::Application.routes.draw do

  devise_for :users
  resources :users

  resources :line_items

  resources :carts

  resources :events

  resources :charges

  get "store/index"
  resources :beers
  root to: 'store#index'#, as: 'store'

  patch 'remove_event/:id' => 'users#remove_event', as: 'remove_event'

end
