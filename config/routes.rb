Rails.application.routes.draw do

  resources :styles, only: [:index]
  resources :beers, only: [:index]

  resources :styles, only: [:index], param: :slug do
    resources :beers, only: [:index]
  end

  resources :carts, only: [:create]

  get '/items' => 'beers#index'
  get '/:slug' => 'styles#show'

end
