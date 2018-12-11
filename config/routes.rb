Rails.application.routes.draw do
  resources :bets
  resources :players
  resources :user
  resources :games
  devise_for :users
  root 'welcome#league_info'
  resources :games
end
