Rails.application.routes.draw do
  root "events#index"
  
  devise_for :users
  
  resources :events, only: [:index, :show, :new, :create]
  resources :attendances, only: [:create, :destroy]
  resources :users, only: [:show]
end
