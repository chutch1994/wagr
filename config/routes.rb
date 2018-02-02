Rails.application.routes.draw do
	resources :users
  resources :games
  devise_for :users
  root 'welcome#index'
	resources :games
end
