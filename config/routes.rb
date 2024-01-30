Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # root "articles#index"
  resources :pets do
    resources :bookings, only: [:new, :create]
  end
  resource :bookings, only: [:index, :update, :destroy]
end
