Rails.application.routes.draw do

  resources :styles, only: [:index] do
    resources :beers, only: [:index]
  end

end
