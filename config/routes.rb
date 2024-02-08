Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :pets do
    resources :bookings, only: [:new, :create, :show, :index]
  end
  resources :bookings, only: [:index, :update, :destroy]

  # get 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  # patch 'bookings/:id', to: 'bookings#update'

  # get 'bookings/:id/reject', to: 'bookings#reject', as: :reject_booking
  # patch 'bookings/:id', to: 'bookings#update'

  resources :bookings do
    member do
      post :accept
      post :reject
    end
  end
end
