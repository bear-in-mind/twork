Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'

  resources :profiles, only: [:edit, :update, :destroy]
  resources :talents, only: [:new, :create, :edit, :update, :destroy]
  resources :comments

  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :tracks, only: [:index, :new, :create, :edit, :update]
  end
  resources :tracks, only: [:show] do
    resources :sessions, only: [:new, :create, :destroy] do
      resources :audio_files, only: [:new, :create, :destroy]
    end
    resources :messages, only: [:new, :create, :destroy]
  end

end
