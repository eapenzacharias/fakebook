Rails.application.routes.draw do
  root to: 'home#signin'
  devise_for :users, controllers: { sessions: 'users/sessions' }
end
