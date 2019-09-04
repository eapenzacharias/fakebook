# frozen_string_literal: true
a
Rails.application.routes.draw do
  devise_for :models
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    unlocks: 'users/unlocks',
                                    omniauth_callbacks: 'user/omniauth_callbacks' }

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
end
