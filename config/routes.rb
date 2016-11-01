Rails.application.routes.draw do

  # resources :styles, :path => '', only: [:index, :show], param: :slug do
  #   resources :beers, only: [:index]
  # end
  resources :styles, only: [:index]

  resources :styles, only: [:index], param: :slug do
    resources :beers, only: [:index]
  end

  get '/:slug' => 'styles#show'


end
