Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  namespace :prototypes do
    resources :popular, only: :index
  end
  resources :prototypes do
    resources :goods, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :show, :index, :update]
  resources :tags, only: [:index, :show]
end
