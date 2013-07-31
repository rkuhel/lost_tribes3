LostTribes3::Application.routes.draw do
  devise_for :users
  devise_for :views
  resources :beers

  root 'beers#index'
end
