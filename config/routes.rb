LostTribes3::Application.routes.draw do

  resources :line_items

  resources :carts

  resources :events

  get "store/index"
  resources :beers
  root to: 'store#index', as: 'store'


end
