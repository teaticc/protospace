Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :goods, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :show, :index, :update]
end
