# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'movies#index'
  resources :movies do
    resources :reviews
  end
  resources :users
  get 'signup', to: 'users#new'
end
