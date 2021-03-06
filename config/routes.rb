Rails.application.routes.draw do
  devise_scope :user do
    # fixed an issue I had with devise 'user session' and my own 'session' clashing. 
    # found online @ https://stackoverflow.com/questions/18392033/no-route-matches-post-sessions-user
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  devise_for :users

  resources :sessions
  resources :players
  resources :games
  resources :gamemasters

  # Kept older code incase something broke with new adjustments, 
  # plus I spent ages putting it together and felt cheated when I remembered the above code.
  # Definitely deletable at this point.

  # get 'sessions', to: 'sessions#index'
  # get 'sessions/new', to: 'sessions#new'
  # get 'sessions/:id', to: 'sessions#show', as: 'session'
  # get 'sessions/:id/edit', to: 'sessions#edit', as: 'edit_session'
  # patch 'sessions/:id', to: 'sessions#update'
  # post 'sessions', to: 'sessions#create'
  # delete 'sessions/:id', to: 'sessions#destroy'

  # get 'players', to: 'players#index'
  # get 'players/new', to: 'players#new'
  # get 'players/:id', to: 'players#show', as: 'player'
  # get 'players/:id/edit', to: 'players#edit', as: 'edit_player'
  # patch 'players/:id', to: 'players#update'
  # post 'players', to: 'players#create'
  # delete 'players/:id', to: 'players#destroy'

  # get 'games', to: 'games#index'
  # get 'games/new', to: 'games#new'
  # get 'games/:id', to: 'games#show', as: 'game'
  # get 'games/:id/edit', to: 'games#edit', as: 'edit_game'
  # patch 'games/:id', to: 'games#update'
  # post 'games', to: 'games#create'
  # delete 'games/:id', to: 'games#destroy'

  # get 'gamemasters', to: 'gamemasters#index'
  # get 'gamemasters/new', to: 'gamemasters#new'
  # get 'gamemasters/:id', to: 'gamemasters#show', as: 'gamemaster'
  # get 'gamemasters/:id/edit', to: 'gamemasters#edit', as: 'edit_gamemaster'
  # patch 'gamemasters/:id', to: 'gamemasters#update'
  # post 'gamemasters', to: 'gamemasters#create'
  # delete 'gamemasters/:id', to: 'gamemasters#destroy'

  root 'games#index'
end
