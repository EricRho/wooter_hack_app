Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :videos, only: [:index, :new, :create, :show, :edit]

  root :to => 'videos#index'
end
