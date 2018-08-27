Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:edit, :update, :destroy]
  resources :projects
