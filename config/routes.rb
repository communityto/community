Rails.application.routes.draw do
  # HOME
  root "pages#home"

  # USERS
  resources :user_sessions, only: [:create]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :bookings, only: [:index, :edit, :update, :destroy]
    resources :reviews, only: [:index]
    resources :favourite_spaces, only: [:index]
    resources :hosted_spaces, only: [:index, :show]
  end

  # ACCOUNTS
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # SPACES
  resources :spaces do
    resources :bookings
    resources :reviews
  end

  #

  # DELETE & EDIT /reviews/:id
  resources :reviews, only: [:destroy, :edit, :update]

  # FAVOURITES
  resources :favourite_spaces, only: [:create, :destroy]

  # CATEGORIES
  resources :categories, only: [:index, :show]

  # SEARCH
  get 'search', to: 'search#new'
  get 'search_results', to: 'search#results'

  # APPROVE BOOKING
  get "/hosted_spaces/approve_booking" => "bookings_controller#approve_booking", :as => 'approve_booking'
end
