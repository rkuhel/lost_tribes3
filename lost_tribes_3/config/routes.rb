LostTribes3::Application.routes.draw do
  get "store/index"
  resources :beers
  root to: 'store#index', as: 'store'


end
