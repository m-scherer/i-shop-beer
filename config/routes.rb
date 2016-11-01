Rails.application.routes.draw do

  resources :styles, only: [:index, :show] do
    resources :beers, only: [:index]
  end

  resources :carts, only: [:create]

end
