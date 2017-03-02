Rails.application.routes.draw do

  resources :favourite_spaces, only: [:create, :destroy]

  root "spaces#index"
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :spaces, only: [:edit, :update]
  resources :spaces, only: [:index, :new, :create, :show] do
    resources :bookings
    resources :reviews
  end

  # resources :users, only: [:new, :create, :show]
  # resources :user_sessions, only: [:create]
  # resources :categories, only: [:index, :show]

  # get 'login' => 'user_sessions#new', :as => :login
  # post 'logout' => 'user_sessions#destroy', :as => :logout



end
