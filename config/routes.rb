Rails.application.routes.draw do

  resources :favourite_spaces, only: [:create, :destroy]

  root "spaces#index"
  resources :user_sessions, only: [:create]
  resources :users, only: [:new, :create, :show]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :spaces, only: [:edit, :update]
  resources :spaces, only: [:index, :new, :create, :show] do
    resources :bookings
    resources :reviews
  end

  resources :categories, only: [:index, :show]

end
