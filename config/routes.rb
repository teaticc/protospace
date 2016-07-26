Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :goods, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :show, :index, :update]
end
