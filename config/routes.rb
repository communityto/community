Rails.application.routes.draw do
  # HOME
  root "pages#home"

  # USERS
  resources :user_sessions, only: [:create]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :bookings, only: [:index, :edit, :update, :destroy]
    resources :reviews, only: [:index]
    resources :favourite_spaces, only: [:index]
    resources :hosted_spaces, only: [:index, :show,]
    resources :personal_messages, only: [:create, :new]
    resources :conversations, only: [:index, :show,]
  end

  post 'users/:user_id/conversations/:id' => 'conversations#reply', :as => :reply
  # ACCOUNTS
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # SPACES
  resources :spaces do
    resources :bookings
    resources :reviews
  end

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

  # ENABLE/DISABLE DATES
  patch "/users/:user_id/hosted_spaces/:id/disable_date" => "hosted_spaces#disable_date", :as => 'disable_date'
  patch "/users/:user_id/hosted_spaces/:id/enable_date" => "hosted_spaces#enable_date", :as => 'enable_date'

  # FACEBOOK LOGIN
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end
