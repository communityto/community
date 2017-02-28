Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "spaces#index"

resources :spaces, only: [:index, :new, :create, :show] do
  resources :reviews
  resources :bookings
end
resources :users, only: [:new, :create, :show]
resources :user_sessions, only: [:new, :create, :destroy]
resources :categories, only: [:index, :show]

get 'login' => 'user_sessions#new', :as => :login
post 'logout' => 'user_sessions#destroy', :as => :logout


end
