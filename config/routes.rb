Rails.application.routes.draw do
  # devise_for :admins
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks'}
  # resources :videos, only: [:index, :new, :create, :update, :show, :edit, :destroy]
  resources :videos

  root :to => 'videos#index'
end
