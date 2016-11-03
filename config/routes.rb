Rails.application.routes.draw do

  resources :styles, only: [:index]
  resources :beers, only: [:index]

  resources :styles, only: [:index], param: :slug do
    resources :beers, only: [:index]
  end

  resources :users, only: [:new, :create] do
    resources :orders, only: [:create, :show]
  end

  get '/dashboard', to: 'dashboard#show'

  resources :cart, only: [:create]

  delete '/cart/remove', path: 'destroy/:id'
  post '/cart/update', path: 'update'
  get '/cart' => 'cart#show'

  get '/items' => 'beers#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root to: 'sessions#new'

  get '/:slug' => 'styles#show'
end
