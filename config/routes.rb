# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :models
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    unlocks: 'users/unlocks',
                                    omniauth_callbacks: 'user/omniauth_callbacks' }

  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update]

  devise_scope :user do
    authenticated :user do
      root 'feed#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  get '/posts', to: 'feed#index'
  get '/feed', to: 'feed#index'
  #get '/sign_up', to: 'users/registrations'
end
