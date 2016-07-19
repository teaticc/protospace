Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resource :prototypes, only: [:index, :show, :new, :create]
  resources :users, only: [:edit, :show, :index, :update]
end
