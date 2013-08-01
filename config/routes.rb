LostTribes3::Application.routes.draw do
<<<<<<< HEAD

  devise_for :users
  resources :line_items

  resources :carts

  resources :events

  get "store/index"
  resources :beers
  root to: 'store#index', as: 'store'


=======
  devise_for :users
  devise_for :views
  resources :beers

  root 'beers#index'
>>>>>>> chris
end
