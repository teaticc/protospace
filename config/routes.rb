Rails.application.routes.draw do
  devise_for :users
 # , :controllers => {:registrations => "users/registrations"}
  root 'prototypes#index'
  get  '/prototypes/index'  =>    'prototypes#index'
  get  '/prototypes/new'    =>    'prototypes#new'
  get  '/prototypes/show'   =>    'prototypes#show'
  resources :users, only: :edit
end
