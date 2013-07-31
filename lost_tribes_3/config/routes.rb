LostTribes3::Application.routes.draw do

  resources :events

  get "store/index"
  resources :beers
  root to: 'store#index', as: 'store'


end
