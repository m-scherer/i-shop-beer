Rails.application.routes.draw do

  resources :styles, only: [:index]
  resources :beers, only: [:index]

  resources :styles, only: [:index], param: :slug do
    resources :beers, only: [:index]
  end

  resources :carts, only: [:create]
  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#show'

  get '/items' => 'beers#index'
  get '/:slug' => 'styles#show'


  get '/', to: 'sessions#new', as: 'login'
  post '/', to: 'sessions#create'
  delete '/', to: 'sessions#destroy', as: 'logout'


end
