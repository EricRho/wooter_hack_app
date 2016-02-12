Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks'}
  # devise_for :admins
  # resources :videos, only: [:index, :new, :create, :update, :show, :edit, :destroy]
  resources :videos do 
  	resources :comments
  end
  match "/404" => "errors#error404", via: [:get, :post, :patch, :delete]

  root :to => 'videos#index'
end
