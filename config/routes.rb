<<<<<<< HEAD
Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: "user/confirmations",
    passwords: "user/passwords",
    registrations: "user/registrations",
    sessions: "user/sessions",
    unlocks: "user/unlocks",
    omniauth_callbacks: "user/omniauth_callbacks",
  }

  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :destroy, :edit, :update]

  devise_scope :user do
    authenticated :user do
      root 'feed#index', as: :authenticated_root
    end

    unauthenticated do
      root 'user/sessions#new', as: :unauthenticated_root
    end
  end
  get "/feed", to: "feed#index"
=======
# frozen_string_literal: true

#  Routes for our fakebook app
Rails.application.routes.draw do
  root to: 'home#signin'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :posts, only: [:index, :new, :create]
>>>>>>> 4b30492c3e98204a6a23cfa1d654b50139bce145
end
