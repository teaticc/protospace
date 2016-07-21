Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:show,:index, :new, :create]
  resources :users, only: [:edit, :show, :index, :update]
end
