Rails.application.routes.draw do

  resources :styles, only: [:index]
  resources :beers, only: [:index]

  resources :styles, only: [:index], param: :slug do
    resources :beers, only: [:index]
  end

  resources :cart, only: [:create, ]

  delete '/cart/remove', path: 'destroy/:id'
  post '/cart/update', path: 'update'
  get '/cart' => 'cart#show'

  get '/items' => 'beers#index'
  get '/:slug' => 'styles#show'


end
