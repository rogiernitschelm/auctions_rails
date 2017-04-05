Rails.application.routes.draw do
  namespace :api do
    resources :employers, only: [:create, :show, :update, :destroy]
    resources :job_seekers, only: [:create, :show, :update, :destroy]
  end

  namespace :admin do
    resources :employers
    resources :job_seekers
  end

  resources :users, only: [:update]
  resources :user_sessions, only: [:create, :destroy]
end
