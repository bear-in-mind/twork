Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:index, :show, :edit, :update, :destroy]
  resources :talents, only: [:destroy]

  resources :comments

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :tracks, only: :create
  end
  resources :tracks, only: [:show, :update, :destroy] do
    resources :sessions, only: [:new, :create, :destroy, :update] do
      resources :audio_files, only: [:new, :create, :destroy]
    end
    resources :messages, only: [:new, :create, :destroy]
  end

end
