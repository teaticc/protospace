Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resource :prototypes, only: [:index, :new, :create]
  resources :prototypes, only: [:show]
  resources :users, only: [:edit, :show, :index, :update]
end
