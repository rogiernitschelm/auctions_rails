Rails.application.routes.draw do
  namespace :api do
    resources :sellers, only: [:create, :show, :update, :destroy]
    resources :buyers, only: [:create, :show, :update, :destroy]
  end

  namespace :admin do
    resources :sellers
    resources :buyers
  end

  resources :users, only: [:update]
  resources :user_sessions, only: [:create, :destroy]
end
