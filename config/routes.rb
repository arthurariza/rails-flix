# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :genres
  root 'movies#index'

  get 'movies/filter/:filter', to: 'movies#index', as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites, only: %i[create destroy]
  end

  resource :session, only: %i[new create destroy]

  resources :users
  get 'signup', to: 'users#new'
end
