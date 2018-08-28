Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:edit, :update, :destroy]
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :tracks, only: [:index, :new, :create, :edit, :update]
  end
  resources :tracks, only: [:show]
end
