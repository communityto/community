Rails.application.routes.draw do

  resources :favourite_spaces, only: [:create, :destroy]

  root "spaces#index"
  resources :user_sessions, only: [:create]
  resources :users, only: [:new, :create, :show, :edit] do
    resources :bookings, only: [:index]
    resources :reviews, only: [:index]
    resources :favourite_spaces, only: [:index]
  end
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :spaces do
    resources :bookings
    resources :reviews
  end

  resources :categories, only: [:index, :show]

end
