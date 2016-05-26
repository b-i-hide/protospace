Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit]
  root 'prototypes#index'

  get  '/prototypes/index'  =>    'prototypes#index'
  get  '/prototypes/new'    =>    'prototypes#new'
  get  '/prototypes/show'   =>    'prototypes#show'
end
