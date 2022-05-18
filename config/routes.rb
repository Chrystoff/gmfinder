Rails.application.routes.draw do
  devise_scope :user do
    # fixed an issue I had with devise user session and my own session clashing. found online @ https://stackoverflow.com/questions/18392033/no-route-matches-post-sessions-user
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  devise_for :users
  get 'sessions', to: 'sessions#index'
  get 'sessions/:id', to: 'sessions#show', as: 'session'

  get 'games', to: 'games#index'
  get 'games/:id', to: 'games#show', as: 'game'

  get 'gamemasters', to: 'gamemasters#index'
  get 'gamemasters/:id', to: 'gamemasters#show', as: 'gamemaster'

  root 'games#index'
end
