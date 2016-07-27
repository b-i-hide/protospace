Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show]
  resources :prototypes
  scope module: :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    resources :newest, only: :index
  end
end
