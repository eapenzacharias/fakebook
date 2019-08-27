# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    unlocks: 'users/unlocks',
                                    omniauth_callbacks: 'user/omniauth_callbacks' }

  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :destroy, :edit, :update]

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  get '/feed', to: 'feed#index'
end
