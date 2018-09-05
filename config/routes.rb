Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:index, :show, :edit, :update, :destroy]
  resources :talents, only: [:destroy]

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :tracks, only: :create
  end

  resources :tracks, only: [:show, :update, :destroy] do
    resources :sessions, only: [:create]
  end

  resources :sessions, only: [:destroy, :new] do
    resources :audio_files, only: :create
  end

  resources :audio_files, only: [] do
    resources :comments, only: :create
  end
end
