Rails.application.routes.draw do
  get 'sessions', to: 'sessions#index'
  get 'sessions/show', to: 'sessions#show'
  get 'games', to: 'games#index'
  get 'games/show', to: 'games#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'games#index'
end
