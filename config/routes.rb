Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations', passwords: 'users/passwords', registrations: 'users/registrations', sessions: 'users/sessions', unlocks: 'users/unlocks', omniauth_callbacks: 'user/omniauth_callbacks' }
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :posts do 
    resources :likes
    resources :comments
  end

  get 'friends/index'
  get 'friends/destroy'
  post '/friendshipconfirm', to: 'user#confirm_friend'
  resources :friend_requests
  resources :friendships

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
  get '/users', to: 'users#index'
end
